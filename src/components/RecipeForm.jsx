import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import ImageUploader from "./ImageUploader.jsx";
import { CATEGORIES } from "../lib/constants.js";

const emptyIngredientRow = () => ({
  ingredientId: "",
  measurementId: "",
  amount: "",
});

const emptyStepRow = () => ({
  text: "",
  imageUrl: "",
});

const buildFormState = (data) => ({
  name: data?.name || "",
  category: data?.category || "",
  prepTime: data?.prepTime ?? 0,
  cookTime: data?.cookTime ?? 0,
  serves: data?.serves ?? 1,
  imageUrl: data?.imageUrl || "",
  ingredients: data?.ingredients?.length
    ? data.ingredients.map((item) => ({
        ingredientId: item.ingredientId,
        measurementId: item.measurementId,
        amount: item.amount,
      }))
    : [emptyIngredientRow()],
  steps: data?.steps?.length
    ? data.steps
        .slice()
        .sort((a, b) => a.stepNumber - b.stepNumber)
        .map((step) => ({
          text: step.text,
          imageUrl: step.imageUrl || "",
        }))
    : [emptyStepRow()],
});

const RecipeForm = ({ recipe, onSave, onCancel }) => {
  const [ingredients, setIngredients] = useState([]);
  const [measurements, setMeasurements] = useState([]);
  const [form, setForm] = useState(buildFormState(recipe));
  const [isSaving, setIsSaving] = useState(false);
  const [modal, setModal] = useState({ type: "", index: null, name: "", error: "" });

  useEffect(() => {
    const load = async () => {
      const [ingredientData, measurementData] = await Promise.all([
        api.getIngredients(),
        api.getMeasurements(),
      ]);
      setIngredients(ingredientData || []);
      setMeasurements(measurementData || []);
    };
    load();
  }, []);

  useEffect(() => {
    setForm(buildFormState(recipe));
  }, [recipe]);

  const updateField = (field, value) => {
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const updateIngredient = (index, field, value) => {
    setForm((prev) => {
      const next = [...prev.ingredients];
      next[index] = { ...next[index], [field]: value };
      return { ...prev, ingredients: next };
    });
  };

  const updateStep = (index, field, value) => {
    setForm((prev) => {
      const next = [...prev.steps];
      next[index] = { ...next[index], [field]: value };
      return { ...prev, steps: next };
    });
  };

  const moveStep = (index, direction) => {
    setForm((prev) => {
      const next = [...prev.steps];
      const target = index + direction;
      if (target < 0 || target >= next.length) {
        return prev;
      }
      [next[index], next[target]] = [next[target], next[index]];
      return { ...prev, steps: next };
    });
  };

  const openAddModal = (type, index) => {
    setModal({ type, index, name: "", error: "" });
  };

  const closeAddModal = () => {
    setModal({ type: "", index: null, name: "", error: "" });
  };

  const handleModalSave = async () => {
    const trimmed = modal.name.trim();
    if (!trimmed) {
      setModal((prev) => ({ ...prev, error: "Name required" }));
      return;
    }
    try {
      if (modal.type === "ingredient") {
        const created = await api.createIngredient({
          name: trimmed,
        });
        setIngredients((prev) => [...prev, created]);
        updateIngredient(modal.index, "ingredientId", created.id);
      }
      if (modal.type === "measurement") {
        const created = await api.createMeasurement({
          name: trimmed,
        });
        setMeasurements((prev) => [...prev, created]);
        updateIngredient(modal.index, "measurementId", created.id);
      }
      closeAddModal();
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        setModal((prev) => ({ ...prev, error: "Already exists" }));
        return;
      }
      setModal((prev) => ({ ...prev, error: "Unable to add" }));
    }
  };

  const handleSave = async () => {
    const payload = {
      name: form.name,
      category: form.category,
      prepTime: Number(form.prepTime),
      cookTime: Number(form.cookTime),
      serves: Number(form.serves),
      imageUrl: form.imageUrl || null,
      ingredients: form.ingredients
        .filter((item) => item.ingredientId)
        .map((item) => ({
          ingredientId: item.ingredientId,
          measurementId: item.measurementId || null,
          amount: Number(item.amount || 0),
        })),
      steps: form.steps
        .filter((step) => step.text)
        .map((step, index) => ({
          text: step.text,
          imageUrl: step.imageUrl || null,
          stepNumber: index + 1,
        })),
    };

    setIsSaving(true);
    try {
      await onSave(payload);
    } finally {
      setIsSaving(false);
    }
  };

  return (
    <div className="admin-form">
      <label className="field-label">Recipe name</label>
      <input
        type="text"
        value={form.name}
        onChange={(event) => updateField("name", event.target.value)}
      />

      <label className="field-label">Category</label>
      <select
        value={form.category}
        onChange={(event) => updateField("category", event.target.value)}
      >
        <option value="">Select</option>
        {CATEGORIES.map((category) => (
          <option key={category} value={category}>
            {category}
          </option>
        ))}
      </select>

      <label className="field-label">Prep time (minutes)</label>
      <input
        type="number"
        value={form.prepTime}
        onChange={(event) => updateField("prepTime", event.target.value)}
      />

      <label className="field-label">Cook time (minutes)</label>
      <input
        type="number"
        value={form.cookTime}
        onChange={(event) => updateField("cookTime", event.target.value)}
      />

      <label className="field-label">Serves</label>
      <input
        type="number"
        value={form.serves}
        onChange={(event) => updateField("serves", event.target.value)}
      />

      <ImageUploader
        label="Main image"
        value={form.imageUrl}
        onChange={(value) => updateField("imageUrl", value)}
      />

      <h2>Ingredients</h2>
      {form.ingredients.map((row, index) => (
        <div key={`ingredient-${index}`} className="inline-row">
          <select
            value={row.ingredientId}
            onChange={(event) =>
              event.target.value === "__add_new__"
                ? openAddModal("ingredient", index)
                : updateIngredient(index, "ingredientId", event.target.value)
            }
          >
            <option value="">Ingredient</option>
            {ingredients.map((ingredient) => (
              <option key={ingredient.id} value={ingredient.id}>
                {ingredient.name}
              </option>
            ))}
            <option value="__add_new__">Add new</option>
          </select>
          <select
            value={row.measurementId}
            onChange={(event) =>
              event.target.value === "__add_new__"
                ? openAddModal("measurement", index)
                : updateIngredient(index, "measurementId", event.target.value)
            }
          >
            <option value="">Measurement</option>
            {measurements.map((measurement) => (
              <option key={measurement.id} value={measurement.id}>
                {measurement.name}
              </option>
            ))}
            <option value="__add_new__">Add new</option>
          </select>
          <input
            type="number"
            value={row.amount}
            onChange={(event) => updateIngredient(index, "amount", event.target.value)}
          />
          <button
            type="button"
            onClick={() =>
              setForm((prev) => ({
                ...prev,
                ingredients: prev.ingredients.filter((_, i) => i !== index),
              }))
            }
          >
            Remove
          </button>
        </div>
      ))}
      <button
        type="button"
        onClick={() =>
          setForm((prev) => ({
            ...prev,
            ingredients: [...prev.ingredients, emptyIngredientRow()],
          }))
        }
      >
        Add Ingredient
      </button>

      <h2>Instructions</h2>
      {form.steps.map((step, index) => (
        <div key={`step-${index}`} className="step-row">
          <textarea
            value={step.text}
            onChange={(event) => updateStep(index, "text", event.target.value)}
          />
          <ImageUploader
            label="Step image"
            value={step.imageUrl}
            onChange={(value) => updateStep(index, "imageUrl", value)}
          />
          <div className="inline-row">
            <button type="button" onClick={() => moveStep(index, -1)}>
              Up
            </button>
            <button type="button" onClick={() => moveStep(index, 1)}>
              Down
            </button>
            <button
              type="button"
              onClick={() =>
                setForm((prev) => ({
                  ...prev,
                  steps: prev.steps.filter((_, i) => i !== index),
                }))
              }
            >
              Remove
            </button>
          </div>
        </div>
      ))}
      <button
        type="button"
        onClick={() =>
          setForm((prev) => ({ ...prev, steps: [...prev.steps, emptyStepRow()] }))
        }
      >
        Add Step
      </button>

      <div className="inline-row">
        <button type="button" onClick={handleSave} disabled={isSaving}>
          {isSaving ? "Saving..." : "Save Recipe"}
        </button>
        <button type="button" onClick={onCancel}>
          Close
        </button>
      </div>

      {modal.type ? (
        <div className="modal-backdrop" role="presentation" onClick={closeAddModal}>
          <div
            className="modal"
            role="dialog"
            aria-modal="true"
            onClick={(event) => event.stopPropagation()}
          >
            <h3>{modal.type === "ingredient" ? "Add Ingredient" : "Add Measurement"}</h3>
            <input
              type="text"
              value={modal.name}
              onChange={(event) =>
                setModal((prev) => ({ ...prev, name: event.target.value, error: "" }))
              }
            />
            {modal.error ? <div className="inline-message">{modal.error}</div> : null}
            <div className="inline-row">
              <button type="button" onClick={handleModalSave}>
                Add
              </button>
              <button type="button" onClick={closeAddModal}>
                Cancel
              </button>
            </div>
          </div>
        </div>
      ) : null}
    </div>
  );
};

export default RecipeForm;
