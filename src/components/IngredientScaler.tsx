import { SCALE_OPTIONS } from "../lib/constants";

type IngredientScalerProps = {
  scale: number;
  onChange: (scale: number) => void;
};

const IngredientScaler = ({ scale, onChange }: IngredientScalerProps) => {
  return (
    <div className="ingredient-scaler">
      {SCALE_OPTIONS.map((option) => (
        <button
          key={option}
          type="button"
          className={scale === option ? "active" : ""}
          onClick={() => onChange(option)}
        >
          {option}x
        </button>
      ))}
    </div>
  );
};

export default IngredientScaler;
