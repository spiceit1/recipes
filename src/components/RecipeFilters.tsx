import { CATEGORIES } from "../lib/constants";

type RecipeFiltersProps = {
  activeCategory: string;
  onChange: (category: string) => void;
};

const RecipeFilters = ({ activeCategory, onChange }: RecipeFiltersProps) => {
  return (
    <div className="recipe-filters">
      <button
        type="button"
        className={activeCategory ? "" : "active"}
        onClick={() => onChange("")}
      >
        All
      </button>
      {CATEGORIES.map((category) => (
        <button
          key={category}
          type="button"
          className={activeCategory === category ? "active" : ""}
          onClick={() => onChange(category)}
        >
          {category}
        </button>
      ))}
    </div>
  );
};

export default RecipeFilters;
