import { type FormEvent, useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { toast } from "react-hot-toast";
import { api } from "../lib/api";
import IngredientScaler from "../components/IngredientScaler";
import ClipboardExporter from "../components/ClipboardExporter";
import PDFExporter from "../components/PDFExporter";
import EmptyState from "../components/EmptyState";
import { getTotalTime, scaleAmount } from "../lib/calculations";
import type { Recipe } from "../lib/types";

type RecipeDetailProps = {
  adminMode: boolean;
};

type CommentFormState = {
  name: string;
  email: string;
  rating: number;
  text: string;
};

const RecipeDetail = ({ adminMode }: RecipeDetailProps) => {
  const { id } = useParams();
  const [recipe, setRecipe] = useState<Recipe | null>(null);
  const [scale, setScale] = useState(1);
  const [isLoading, setIsLoading] = useState(true);
  const [comment, setComment] = useState<CommentFormState>({
    name: "",
    email: "",
    rating: 0,
    text: "",
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    let isMounted = true;
    const load = async () => {
      if (isMounted) {
        setIsLoading(true);
      }
      try {
        if (!id) {
          setRecipe(null);
          return;
        }
        const data = await api.getRecipe(id, adminMode);
        if (isMounted) {
          setRecipe(data);
        }
      } catch (error) {
        if (isMounted) {
          setRecipe(null);
        }
      } finally {
        if (isMounted) {
          setIsLoading(false);
        }
      }
    };
    load();
    return () => {
      isMounted = false;
    };
  }, [id, adminMode]);

  const handleSubmit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (!comment.name || !comment.email || !comment.rating) {
      toast.error("Rating is required.");
      return;
    }
    setIsSubmitting(true);
    try {
      await api.postComment({
        recipeId: id,
        name: comment.name,
        email: comment.email,
        rating: Number(comment.rating),
        comment: comment.text,
      });
      setComment({ name: "", email: "", rating: 0, text: "" });
      toast.success("Thank you for your rating and comment.");
    } catch (error) {
      toast.error("Unable to submit comment.");
    } finally {
      setIsSubmitting(false);
    }
  };

  if (isLoading) {
    return <div className="empty-state">Loading...</div>;
  }

  if (!recipe) {
    return <EmptyState message="Recipe not found" />;
  }

  const totalTime = recipe.totalTime ?? getTotalTime(recipe.prepTime, recipe.cookTime);
  const ingredients = recipe.ingredients || [];
  const hasSections = ingredients.some((item) => item.section && item.section.trim());
  const groupedIngredients = ingredients.reduce(
    (acc, item) => {
      const section = item.section?.trim() || "";
      const key = section || "__default__";
      if (!acc.map.has(key)) {
        const label = section || "";
        const group = { key, label, items: [] };
        acc.map.set(key, group);
        acc.order.push(group);
      }
      acc.map.get(key)?.items.push(item);
      return acc;
    },
    { map: new Map<string, { key: string; label: string; items: typeof ingredients }>(), order: [] as Array<{ key: string; label: string; items: typeof ingredients }> }
  ).order;

  return (
    <section className="recipe-detail">
      <div className="recipe-hero">
        {recipe.imageUrl ? (
          <img src={recipe.imageUrl} alt={recipe.name} />
        ) : (
          <div className="image-placeholder large" />
        )}
        <div className="recipe-hero-text">
          <div className="recipe-category">{recipe.category}</div>
          <h1>{recipe.name}</h1>
          <div className="recipe-meta">
            <span>Prep {recipe.prepTime} min</span>
            <span>Cook {recipe.cookTime} min</span>
            <span>Total {totalTime} min</span>
            <span>Serves {recipe.serves}</span>
          </div>
          <div className="recipe-actions">
            <IngredientScaler scale={scale} onChange={setScale} />
            <ClipboardExporter recipe={recipe} />
            <PDFExporter recipe={recipe} />
          </div>
        </div>
      </div>

      <div className="recipe-body">
        <div className="ingredients">
          <h2>Ingredients</h2>
          {hasSections ? (
            groupedIngredients.map((group) => (
              <div key={group.key} className="ingredient-section">
                {group.label ? <h3>{group.label}</h3> : null}
                <ul>
                  {group.items.map((item) => (
                    <li key={item.id}>
                      {`${scaleAmount(item.amount, scale)} ${
                        item.measurement?.name ? `${item.measurement.name} ` : ""
                      }${item.ingredient?.name || ""}`.trim()}
                    </li>
                  ))}
                </ul>
              </div>
            ))
          ) : (
            <ul>
              {ingredients.map((item) => (
                <li key={item.id}>
                  {`${scaleAmount(item.amount, scale)} ${
                    item.measurement?.name ? `${item.measurement.name} ` : ""
                  }${item.ingredient?.name || ""}`.trim()}
                </li>
              ))}
            </ul>
          )}
        </div>
        <div className="instructions">
          <h2>Instructions</h2>
          <ol>
            {(recipe.steps || [])
              .sort((a, b) => a.stepNumber - b.stepNumber)
              .map((step) => (
                <li key={step.id}>
                  <p>{step.text}</p>
                  {step.imageUrl ? (
                    <img src={step.imageUrl} alt="" />
                  ) : null}
                </li>
              ))}
          </ol>
        </div>
      </div>

      <form className="comment-form" onSubmit={handleSubmit}>
        <h3>Leave a comment</h3>
        <label className="field-label" htmlFor="comment-name">
          Name (required)
        </label>
        <input
          type="text"
          id="comment-name"
          required
          value={comment.name}
          onChange={(event) =>
            setComment((prev) => ({ ...prev, name: event.target.value }))
          }
        />
        <label className="field-label" htmlFor="comment-email">
          Email (required)
        </label>
        <input
          type="email"
          id="comment-email"
          required
          value={comment.email}
          onChange={(event) =>
            setComment((prev) => ({ ...prev, email: event.target.value }))
          }
        />
        <div className="rating-picker" role="radiogroup" aria-label="Tap to rate">
          <div className="rating-label">Rating (required)</div>
          <div className="rating-stars">
            {[1, 2, 3, 4, 5].map((rating) => (
              <button
                key={rating}
                type="button"
                className={comment.rating >= rating ? "star active" : "star"}
                onClick={() =>
                  setComment((prev) => ({ ...prev, rating }))
                }
                aria-pressed={comment.rating >= rating}
              >
                ★
              </button>
            ))}
          </div>
        </div>
        <label className="field-label" htmlFor="comment-text">
          Comment (optional)
        </label>
        <textarea
          id="comment-text"
          value={comment.text}
          onChange={(event) =>
            setComment((prev) => ({ ...prev, text: event.target.value }))
          }
        />
        <button type="submit" className="admin-action success" disabled={isSubmitting}>
          {isSubmitting ? "Sending..." : "Submit"}
        </button>
      </form>
    </section>
  );
};

export default RecipeDetail;
