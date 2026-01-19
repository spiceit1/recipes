import { jsPDF } from "jspdf";

const PDFExporter = ({ recipe }) => {
  const handleExport = async () => {
    if (!recipe) {
      return;
    }

    const doc = new jsPDF();
    let y = 20;

    doc.setFontSize(18);
    doc.text(recipe.name || "Recipe", 14, y);
    y += 8;
    doc.setFontSize(11);
    doc.text(`Category: ${recipe.category}`, 14, y);
    y += 6;
    doc.text(`Serves: ${recipe.serves}`, 14, y);
    y += 6;
    y += 2;

    if (recipe.imageUrl) {
      try {
        const img = await fetch(recipe.imageUrl);
        const blob = await img.blob();
        const dataUrl = await new Promise((resolve) => {
          const reader = new FileReader();
          reader.onloadend = () => resolve(reader.result);
          reader.readAsDataURL(blob);
        });
        doc.addImage(dataUrl, "JPEG", 14, y, 180, 80);
        y += 88;
      } catch (error) {
        y += 2;
      }
    }

    doc.setFontSize(13);
    doc.text("Ingredients", 14, y);
    y += 6;
    doc.setFontSize(11);
    (recipe.ingredients || []).forEach((item) => {
      doc.text(
        `- ${item.amount} ${
          item.measurement?.name ? `${item.measurement.name} ` : ""
        }${item.ingredient?.name || ""}`.trim(),
        14,
        y
      );
      y += 5;
    });

    y += 4;
    doc.setFontSize(13);
    doc.text("Instructions", 14, y);
    y += 6;
    doc.setFontSize(11);
    (recipe.steps || [])
      .sort((a, b) => a.stepNumber - b.stepNumber)
      .forEach((step, index) => {
        doc.text(`${index + 1}. ${step.text}`, 14, y);
        y += 5;
      });

    y += 6;
    doc.text(`Prep: ${recipe.prepTime} min`, 14, y);
    y += 5;
    doc.text(`Cook: ${recipe.cookTime} min`, 14, y);
    y += 5;
    doc.text(`Total: ${recipe.totalTime} min`, 14, y);

    doc.save(`${recipe.name || "recipe"}.pdf`);
  };

  return (
    <button type="button" className="ghost-button" onClick={handleExport}>
      Download as PDF
    </button>
  );
};

export default PDFExporter;
