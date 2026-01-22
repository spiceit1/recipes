import { Link } from "react-router-dom";
import { type RecipeSummary } from "../lib/types";

type RecipeCardProps = {
  recipe: RecipeSummary;
};

const RecipeCard = ({ recipe }: RecipeCardProps) => {
  return (
    <Link className="recipe-card" to={`/recipe/${recipe.id}`}>
      <div className="recipe-card-image">
        {recipe.imageUrl ? (
          <img src={recipe.imageUrl} alt={recipe.name} loading="lazy" />
        ) : (
          <div className="image-placeholder" />
        )}
      </div>
      <div className="recipe-card-body">
        <div className="recipe-card-category">{recipe.category}</div>
        <h3>{recipe.name}</h3>
        <div className="recipe-card-meta">
          <span>{recipe.totalTime} min</span>
        </div>
      </div>
    </Link>
  );
};

export default RecipeCard;
