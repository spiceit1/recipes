import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { api } from "../lib/api.js";
import IngredientScaler from "../components/IngredientScaler.jsx";
import ClipboardExporter from "../components/ClipboardExporter.jsx";
import PDFExporter from "../components/PDFExporter.jsx";
import EmptyState from "../components/EmptyState.jsx";
import { getTotalTime, scaleAmount } from "../lib/calculations.js";

const RecipeDetail = ({ adminMode }) => {
  const { id } = useParams();
  const [recipe, setRecipe] = useState(null);
  const [scale, setScale] = useState(1);
  const [comment, setComment] = useState({
    name: "",
    email: "",
    rating: 0,
    text: "",
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    let isMounted = true;
    const load = async () => {
      try {
        const data = await api.getRecipe(id, adminMode);
        if (isMounted) {
          setRecipe(data);
        }
      } catch (error) {
        if (isMounted) {
          setRecipe(null);
        }
      }
    };
    load();
    return () => {
      isMounted = false;
    };
  }, [id, adminMode]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    if (!comment.name || !comment.email || !comment.rating) {
      return;
    }
    setIsSubmitting(true);
    try {
      await api.postComment({
        recipeId: id,
        name: comment.name,
        rating: Number(comment.rating),
        comment: comment.text,
      });
      setComment({ name: "", email: "", rating: 0, text: "" });
    } finally {
      setIsSubmitting(false);
    }
  };

  if (!recipe) {
    return <EmptyState message="Recipe not found" />;
  }

  const totalTime = recipe.totalTime ?? getTotalTime(recipe.prepTime, recipe.cookTime);

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
            <span>{recipe.calories} cal</span>
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
          <ul>
            {(recipe.ingredients || []).map((item) => (
              <li key={item.id}>
                {`${scaleAmount(item.amount, scale)} ${
                  item.measurement?.name ? `${item.measurement.name} ` : ""
                }${item.ingredient?.name || ""}`.trim()}
              </li>
            ))}
          </ul>
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
        <button type="submit" disabled={isSubmitting}>
          {isSubmitting ? "Sending..." : "Submit"}
        </button>
      </form>
    </section>
  );
};

export default RecipeDetail;
