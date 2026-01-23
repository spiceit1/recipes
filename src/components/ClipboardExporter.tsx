import { type Recipe } from "../lib/types";

type ClipboardExporterProps = {
  recipe?: Recipe | null;
};

const ClipboardExporter = ({ recipe }: ClipboardExporterProps) => {
  const buildText = () => {
    if (!recipe) {
      return "";
    }
    const ingredients = recipe.ingredients || [];
    const steps = recipe.steps || [];
    return [
      recipe.name,
      recipe.category,
      `Serves ${recipe.serves}`,
      "",
      "Ingredients:",
      ...ingredients.map((item) =>
        `- ${item.amount} ${
          item.measurement?.name ? `${item.measurement.name} ` : ""
        }${item.ingredient?.name || ""}`.trim()
      ),
      "",
      "Instructions:",
      ...steps
        .sort((a, b) => a.stepNumber - b.stepNumber)
        .map((step, index) => `${index + 1}. ${step.text}`),
      "",
      `Prep: ${recipe.prepTime} min`,
      `Cook: ${recipe.cookTime} min`,
      `Total: ${recipe.totalTime} min`,
    ].join("\n");
  };

  const handleCopy = async () => {
    const text = buildText();
    if (!text) {
      return;
    }
    await navigator.clipboard.writeText(text);
  };

  return (
    <button type="button" className="ghost-button" onClick={handleCopy}>
      <svg viewBox="0 0 24 24" aria-hidden="true">
        <path
          fill="currentColor"
          d="M16 1H8a2 2 0 0 0-2 2v2H5a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h9a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7l-3-6Zm-2 18H5V7h1v8a2 2 0 0 0 2 2h6v2Zm2-4H8V3h7.17L16 5.83V15Z"
        />
      </svg>
      Copy Recipe
    </button>
  );
};

export default ClipboardExporter;
