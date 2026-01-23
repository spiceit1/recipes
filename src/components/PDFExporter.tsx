import { jsPDF } from "jspdf";
import { type Recipe } from "../lib/types";

type PDFExporterProps = {
  recipe?: Recipe | null;
};

const PDFExporter = ({ recipe }: PDFExporterProps) => {
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
        const dataUrl = await new Promise<string | ArrayBuffer | null>((resolve) => {
          const reader = new FileReader();
          reader.onloadend = () => resolve(reader.result);
          reader.readAsDataURL(blob);
        });
        if (typeof dataUrl === "string") {
          doc.addImage(dataUrl, "JPEG", 14, y, 180, 80);
          y += 88;
        } else {
          y += 2;
        }
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
      <svg viewBox="0 0 24 24" aria-hidden="true">
        <path
          fill="currentColor"
          d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6Zm4 18H6V4h7v5h5v11ZM8 13h2.5a2.5 2.5 0 0 0 0-5H8v5Zm2.5-3a.5.5 0 0 1 0 1H10v-1h.5ZM12 13h2.5a2.5 2.5 0 0 0 0-5H12v5Zm2.5-3a.5.5 0 0 1 0 1H14v-1h.5ZM16 13h2v-1h-2V8h-1v5Z"
        />
      </svg>
      Download as PDF
    </button>
  );
};

export default PDFExporter;
