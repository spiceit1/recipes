const ClipboardExporter = ({ recipe }) => {
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
      Copy Recipe
    </button>
  );
};

export default ClipboardExporter;
