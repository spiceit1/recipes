import { useEffect, useRef, useState } from "react";
import { toast } from "react-hot-toast";
import { api } from "../lib/api";
import ImageUploader from "./ImageUploader";
import { CATEGORIES } from "../lib/constants";
import type {
  Ingredient,
  Measurement,
  Recipe,
  RecipeFormIngredientRow,
  RecipeFormRow,
  RecipeFormState,
  RecipePayload,
} from "../lib/types";

const emptyIngredientRow = (): RecipeFormIngredientRow => ({
  type: "ingredient",
  ingredientId: "",
  ingredientName: "",
  measurementId: "",
  measurementName: "",
  amount: "",
});

const emptySectionRow = (): RecipeFormRow => ({
  type: "section",
  title: "",
});

const emptyStepRow = () => ({
  text: "",
  imageUrl: "",
});

const buildFormState = (data?: Recipe | null): RecipeFormState => ({
  name: data?.name || "",
  category: data?.category || "",
  prepTime: data?.prepTime ?? 0,
  cookTime: data?.cookTime ?? 0,
  serves: data?.serves ?? 1,
  imageUrl: data?.imageUrl || "",
  ingredients: data?.ingredients?.length
    ? data.ingredients.reduce<RecipeFormRow[]>((rows, item) => {
        const section = item.section?.trim() || "";
        const last = rows[rows.length - 1];
        if (section && (!last || last.type !== "section" || last.title !== section)) {
          rows.push({ type: "section", title: section });
        }
        rows.push({
          type: "ingredient",
          ingredientId: item.ingredientId || "",
          ingredientName: item.ingredient?.name || "",
          measurementId: item.measurementId || "",
          measurementName: item.measurement?.name || "",
          amount: item.amount ?? "",
        });
        return rows;
      }, [])
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

type RecipeFormProps = {
  recipe?: Recipe | null;
  onSave: (payload: RecipePayload) => Promise<void> | void;
  onCancel: () => void;
};

const RecipeForm = ({ recipe, onSave, onCancel }: RecipeFormProps) => {
  const [ingredients, setIngredients] = useState<Ingredient[]>([]);
  const [measurements, setMeasurements] = useState<Measurement[]>([]);
  const [form, setForm] = useState<RecipeFormState>(buildFormState(recipe));
  const [isSaving, setIsSaving] = useState(false);
  const [sectionFocusIndex, setSectionFocusIndex] = useState<number | null>(null);
  const [newIngredientIndex, setNewIngredientIndex] = useState<number | null>(null);
  const [newMeasurementIndex, setNewMeasurementIndex] = useState<number | null>(null);
  const [activeCombo, setActiveCombo] = useState<{
    type: "ingredient" | "measurement" | null;
    index: number | null;
  }>({ type: null, index: null });
  const [comboHighlight, setComboHighlight] = useState<{
    type: "ingredient" | "measurement" | null;
    index: number | null;
    value: number;
  }>({ type: null, index: null, value: -1 });
  const activeItemRef = useRef<HTMLButtonElement | null>(null);
  const [dragIndex, setDragIndex] = useState<number | null>(null);
  const formRef = useRef(null);

  useEffect(() => {
    const load = async () => {
      const [ingredientData, measurementData] = await Promise.all([
        api.getIngredients(),
        api.getMeasurements(),
      ]);
      setIngredients(
        (ingredientData || []).slice().sort((a, b) => a.name.localeCompare(b.name))
      );
      setMeasurements(
        (measurementData || []).slice().sort((a, b) => a.name.localeCompare(b.name))
      );
    };
    load();
  }, []);

  useEffect(() => {
    setForm(buildFormState(recipe));
  }, [recipe]);

  const updateField = <T extends keyof RecipeFormState>(
    field: T,
    value: RecipeFormState[T]
  ) => {
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const updateIngredient = <T extends keyof RecipeFormIngredientRow>(
    index: number,
    field: T,
    value: RecipeFormIngredientRow[T]
  ) => {
    setForm((prev) => {
      const next = [...prev.ingredients];
      const row = next[index];
      if (!row || row.type !== "ingredient") {
        return prev;
      }
      next[index] = { ...row, [field]: value };
      return { ...prev, ingredients: next };
    });
  };

  const openCombo = (type: "ingredient" | "measurement", index: number) => {
    setActiveCombo({ type, index });
    setComboHighlight({ type, index, value: 0 });
  };

  const closeCombo = () => {
    setActiveCombo({ type: null, index: null });
    setComboHighlight({ type: null, index: null, value: -1 });
  };

  const getFilteredIngredients = (query: string) =>
    ingredients.filter((item) =>
      item.name.toLowerCase().includes(query.toLowerCase())
    );

  const getFilteredMeasurements = (query: string) =>
    measurements.filter((item) =>
      item.name.toLowerCase().includes(query.toLowerCase())
    );

  const renderMatch = (text: string, query: string) => {
    const trimmed = query.trim();
    if (!trimmed) {
      return text;
    }
    const lowerText = text.toLowerCase();
    const lowerQuery = trimmed.toLowerCase();
    const index = lowerText.indexOf(lowerQuery);
    if (index === -1) {
      return text;
    }
    const before = text.slice(0, index);
    const match = text.slice(index, index + trimmed.length);
    const after = text.slice(index + trimmed.length);
    return (
      <>
        {before}
        <span className="combo-match">{match}</span>
        {after}
      </>
    );
  };

  useEffect(() => {
    if (activeItemRef.current) {
      activeItemRef.current.scrollIntoView({ block: "nearest" });
    }
  }, [comboHighlight, activeCombo]);

  const updateSection = (index: number, value: string) => {
    setForm((prev) => {
      const next = [...prev.ingredients];
      const row = next[index];
      if (!row || row.type !== "section") {
        return prev;
      }
      next[index] = { ...row, title: value };
      return { ...prev, ingredients: next };
    });
  };

  const updateStep = <T extends keyof RecipeFormState["steps"][number]>(
    index: number,
    field: T,
    value: RecipeFormState["steps"][number][T]
  ) => {
    setForm((prev) => {
      const next = [...prev.steps];
      next[index] = { ...next[index], [field]: value };
      return { ...prev, steps: next };
    });
  };

  const moveStep = (index: number, direction: number) => {
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

  const moveIngredientRow = (fromIndex: number, toIndex: number) => {
    if (fromIndex === toIndex) {
      return;
    }
    setForm((prev) => {
      const next = [...prev.ingredients];
      if (!next[fromIndex] || !next[toIndex]) {
        return prev;
      }
      const [moved] = next.splice(fromIndex, 1);
      next.splice(toIndex, 0, moved);
      return { ...prev, ingredients: next };
    });
  };

  const toggleNewIngredient = (index: number) => {
    setNewIngredientIndex((prev) => (prev === index ? null : index));
  };

  const toggleNewMeasurement = (index: number) => {
    setNewMeasurementIndex((prev) => (prev === index ? null : index));
  };

  const handleAddIngredient = async () => {
    if (newIngredientIndex === null) {
      return;
    }
    const row = form.ingredients[newIngredientIndex];
    if (!row || row.type !== "ingredient") {
      return;
    }
    const trimmed = row.ingredientName.trim();
    if (!trimmed) {
      toast.error("Name required.");
      return;
    }
    try {
      const created = await api.createIngredient({ name: trimmed });
      setIngredients((prev) =>
        [...prev, created].sort((a, b) => a.name.localeCompare(b.name))
      );
      updateIngredient(newIngredientIndex, "ingredientId", created.id);
      updateIngredient(newIngredientIndex, "ingredientName", created.name);
      setNewIngredientIndex(null);
      toast.success("Ingredient added.");
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        toast.error("Already exists.");
        return;
      }
      toast.error("Unable to add.");
    }
  };

  const handleAddMeasurement = async () => {
    if (newMeasurementIndex === null) {
      return;
    }
    const row = form.ingredients[newMeasurementIndex];
    if (!row || row.type !== "ingredient") {
      return;
    }
    const trimmed = row.measurementName.trim();
    if (!trimmed) {
      toast.error("Name required.");
      return;
    }
    try {
      const created = await api.createMeasurement({ name: trimmed });
      setMeasurements((prev) =>
        [...prev, created].sort((a, b) => a.name.localeCompare(b.name))
      );
      updateIngredient(newMeasurementIndex, "measurementId", created.id);
      updateIngredient(newMeasurementIndex, "measurementName", created.name);
      setNewMeasurementIndex(null);
      toast.success("Measurement added.");
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        toast.error("Already exists.");
        return;
      }
      toast.error("Unable to add.");
    }
  };

  const handleSave = async () => {
    if (!form.name || !form.category) {
      toast.error("Recipe name and category are required.");
      const modalNode = formRef.current?.closest(".modal");
      if (modalNode) {
        modalNode.scrollTo({ top: 0, behavior: "smooth" });
      }
      return;
    }
    let currentSection = "";
    const payload: RecipePayload = {
      name: form.name,
      category: form.category,
      prepTime: Number(form.prepTime),
      cookTime: Number(form.cookTime),
      serves: Number(form.serves),
      imageUrl: form.imageUrl || null,
      ingredients: form.ingredients.reduce<RecipePayload["ingredients"]>((acc, row) => {
        if (row.type === "section") {
          currentSection = row.title.trim();
          return acc;
        }
        if (!row.ingredientId) {
          return acc;
        }
        acc.push({
          ingredientId: row.ingredientId,
          measurementId: row.measurementId || null,
          amount: Number(row.amount || 0),
          section: currentSection || null,
        });
        return acc;
      }, []),
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
    <div className="admin-form" ref={formRef}>
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
        min="0"
        value={form.prepTime}
        onChange={(event) => updateField("prepTime", event.target.value)}
      />

      <label className="field-label">Cook time (minutes)</label>
      <input
        type="number"
        min="0"
        value={form.cookTime}
        onChange={(event) => updateField("cookTime", event.target.value)}
      />

      <label className="field-label">Serves</label>
      <input
        type="number"
        min="1"
        value={form.serves}
        onChange={(event) => updateField("serves", event.target.value)}
      />

      <ImageUploader
        label="Main image"
        value={form.imageUrl}
        onChange={(value) => updateField("imageUrl", value)}
      />

      <h2>Ingredients</h2>
      <div className="tiny-text">Click Add Section to insert a header, then add ingredients below it.</div>
      {form.ingredients.map((row, index) =>
        row.type === "section" ? (
          <div
            key={`section-${index}`}
            className="inline-row ingredient-row"
            onDragOver={(event) => event.preventDefault()}
            onDrop={(event) => {
              event.preventDefault();
              if (dragIndex === null) {
                return;
              }
              moveIngredientRow(dragIndex, index);
              setDragIndex(null);
            }}
          >
            <button
              type="button"
              className="drag-handle"
              draggable
              onDragStart={(event) => {
                event.dataTransfer.effectAllowed = "move";
                const row = (event.currentTarget as HTMLElement).closest(".ingredient-row");
                if (row) {
                  const rect = row.getBoundingClientRect();
                  event.dataTransfer.setDragImage(
                    row,
                    event.clientX - rect.left,
                    event.clientY - rect.top
                  );
                  row.classList.add("dragging");
                }
                setDragIndex(index);
              }}
              onDragEnd={(event) => {
                const row = (event.currentTarget as HTMLElement).closest(".ingredient-row");
                row?.classList.remove("dragging");
                setDragIndex(null);
              }}
              aria-label="Drag to reorder"
            >
              ≡
            </button>
            <input
              type="text"
              placeholder="Section title"
              value={row.title}
              autoFocus={sectionFocusIndex === index}
              onChange={(event) => updateSection(index, event.target.value)}
            />
            <button
              type="button"
              className="admin-action danger"
              onClick={() =>
                setForm((prev) => ({
                  ...prev,
                  ingredients: prev.ingredients.filter((_, i) => i !== index),
                }))
              }
            >
              Remove section
            </button>
          </div>
        ) : (
          <div
            key={`ingredient-${index}`}
            className="inline-row ingredient-row"
            onDragOver={(event) => event.preventDefault()}
            onDrop={(event) => {
              event.preventDefault();
              if (dragIndex === null) {
                return;
              }
              moveIngredientRow(dragIndex, index);
              setDragIndex(null);
            }}
          >
            <button
              type="button"
              className="drag-handle"
              draggable
              onDragStart={(event) => {
                event.dataTransfer.effectAllowed = "move";
                const row = (event.currentTarget as HTMLElement).closest(".ingredient-row");
                if (row) {
                  const rect = row.getBoundingClientRect();
                  event.dataTransfer.setDragImage(
                    row,
                    event.clientX - rect.left,
                    event.clientY - rect.top
                  );
                  row.classList.add("dragging");
                }
                setDragIndex(index);
              }}
              onDragEnd={(event) => {
                const row = (event.currentTarget as HTMLElement).closest(".ingredient-row");
                row?.classList.remove("dragging");
                setDragIndex(null);
              }}
              aria-label="Drag to reorder"
            >
              ≡
            </button>
            <div className="combo-box">
              {(() => {
                const filtered = getFilteredIngredients(row.ingredientName);
                const isActive =
                  activeCombo.type === "ingredient" && activeCombo.index === index;
                const highlight =
                  comboHighlight.type === "ingredient" && comboHighlight.index === index
                    ? comboHighlight.value
                    : -1;
                return (
                  <>
                    <input
                      type="text"
                      placeholder={
                        newIngredientIndex === index
                          ? "New ingredient name"
                          : "Ingredient"
                      }
                      value={row.ingredientName}
                      onFocus={() => openCombo("ingredient", index)}
                      onBlur={() => setTimeout(closeCombo, 100)}
                      onChange={(event) => {
                        updateIngredient(index, "ingredientName", event.target.value);
                        updateIngredient(index, "ingredientId", "");
                        if (newIngredientIndex !== index) {
                          if (!isActive) {
                            openCombo("ingredient", index);
                          }
                          setComboHighlight({ type: "ingredient", index, value: 0 });
                        }
                      }}
                      onKeyDownCapture={(event) => {
                        if (newIngredientIndex === index) {
                          return;
                        }
                        if (event.key === "ArrowDown" || event.key === "ArrowUp") {
                          event.preventDefault();
                          event.stopPropagation();
                          if (!isActive) {
                            openCombo("ingredient", index);
                          }
                          if (!filtered.length) {
                            return;
                          }
                          const next =
                            event.key === "ArrowDown"
                              ? highlight < 0
                                ? 0
                                : Math.min(highlight + 1, filtered.length - 1)
                              : highlight <= 0
                                ? 0
                                : highlight - 1;
                          setComboHighlight({ type: "ingredient", index, value: next });
                        }
                      }}
                      onKeyDown={(event) => {
                        if (newIngredientIndex === index) {
                          return;
                        }
                        if (event.key === "Escape") {
                          closeCombo();
                          return;
                        }
                        if (event.key === "ArrowDown" || event.key === "ArrowUp") {
                          return;
                        }
                        if (event.key === "Enter") {
                          event.preventDefault();
                          const target =
                            highlight >= 0 ? filtered[highlight] : filtered[0];
                          if (target) {
                            updateIngredient(index, "ingredientId", target.id);
                            updateIngredient(index, "ingredientName", target.name);
                            closeCombo();
                          }
                        }
                      }}
                    />
                    {newIngredientIndex !== index && isActive ? (
                      <div className="combo-list">
                        {filtered.map((item, itemIndex) => (
                          <button
                            key={item.id}
                            type="button"
                            className={`combo-item${itemIndex === highlight ? " active" : ""}`}
                            ref={itemIndex === highlight ? activeItemRef : null}
                            onMouseDown={(event) => event.preventDefault()}
                            onClick={() => {
                              updateIngredient(index, "ingredientId", item.id);
                              updateIngredient(index, "ingredientName", item.name);
                              closeCombo();
                            }}
                          >
                            {renderMatch(item.name, row.ingredientName)}
                          </button>
                        ))}
                      </div>
                    ) : null}
                  </>
                );
              })()}
            </div>
            {newIngredientIndex === index ? (
              <button
                type="button"
                className="admin-action primary"
                onClick={handleAddIngredient}
              >
                Add
              </button>
            ) : (
              <button
                type="button"
                className="admin-action secondary icon-button"
                onClick={() => toggleNewIngredient(index)}
                aria-label="Add new ingredient"
              >
                +
              </button>
            )}
            <div className="combo-box">
              {(() => {
                const filtered = getFilteredMeasurements(row.measurementName);
                const isActive =
                  activeCombo.type === "measurement" && activeCombo.index === index;
                const highlight =
                  comboHighlight.type === "measurement" && comboHighlight.index === index
                    ? comboHighlight.value
                    : -1;
                return (
                  <>
                    <input
                      type="text"
                      placeholder={
                        newMeasurementIndex === index
                          ? "New measurement name"
                          : "Measurement"
                      }
                      value={row.measurementName}
                      onFocus={() => openCombo("measurement", index)}
                      onBlur={() => setTimeout(closeCombo, 100)}
                      onChange={(event) => {
                        updateIngredient(index, "measurementName", event.target.value);
                        updateIngredient(index, "measurementId", "");
                        if (newMeasurementIndex !== index) {
                          if (!isActive) {
                            openCombo("measurement", index);
                          }
                          setComboHighlight({ type: "measurement", index, value: 0 });
                        }
                      }}
                      onKeyDownCapture={(event) => {
                        if (newMeasurementIndex === index) {
                          return;
                        }
                        if (event.key === "ArrowDown" || event.key === "ArrowUp") {
                          event.preventDefault();
                          event.stopPropagation();
                          if (!isActive) {
                            openCombo("measurement", index);
                          }
                          if (!filtered.length) {
                            return;
                          }
                          const next =
                            event.key === "ArrowDown"
                              ? highlight < 0
                                ? 0
                                : Math.min(highlight + 1, filtered.length - 1)
                              : highlight <= 0
                                ? 0
                                : highlight - 1;
                          setComboHighlight({ type: "measurement", index, value: next });
                        }
                      }}
                      onKeyDown={(event) => {
                        if (newMeasurementIndex === index) {
                          return;
                        }
                        if (event.key === "Escape") {
                          closeCombo();
                          return;
                        }
                        if (event.key === "ArrowDown" || event.key === "ArrowUp") {
                          return;
                        }
                        if (event.key === "Enter") {
                          event.preventDefault();
                          const target =
                            highlight >= 0 ? filtered[highlight] : filtered[0];
                          if (target) {
                            updateIngredient(index, "measurementId", target.id);
                            updateIngredient(index, "measurementName", target.name);
                            closeCombo();
                          }
                        }
                      }}
                    />
                    {newMeasurementIndex !== index && isActive ? (
                      <div className="combo-list">
                        {filtered.map((item, itemIndex) => (
                          <button
                            key={item.id}
                            type="button"
                            className={`combo-item${itemIndex === highlight ? " active" : ""}`}
                            ref={itemIndex === highlight ? activeItemRef : null}
                            onMouseDown={(event) => event.preventDefault()}
                            onClick={() => {
                              updateIngredient(index, "measurementId", item.id);
                              updateIngredient(index, "measurementName", item.name);
                              closeCombo();
                            }}
                          >
                            {renderMatch(item.name, row.measurementName)}
                          </button>
                        ))}
                      </div>
                    ) : null}
                  </>
                );
              })()}
            </div>
            {newMeasurementIndex === index ? (
              <button
                type="button"
                className="admin-action primary"
                onClick={handleAddMeasurement}
              >
                Add
              </button>
            ) : (
              <button
                type="button"
                className="admin-action secondary icon-button"
                onClick={() => toggleNewMeasurement(index)}
                aria-label="Add new measurement"
              >
                +
              </button>
            )}
            <input
              type="number"
              min="0"
              step="0.01"
              value={row.amount}
              onChange={(event) => updateIngredient(index, "amount", event.target.value)}
            />
            <button
              type="button"
              className="admin-action danger"
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
        )
      )}
      <div className="ingredient-actions">
        <button
          type="button"
          className="admin-action success"
          onClick={() =>
            setForm((prev) => ({
              ...prev,
              ingredients: [...prev.ingredients, emptyIngredientRow()],
            }))
          }
        >
          Add Ingredient
        </button>
        <button
          type="button"
          className="admin-action secondary"
          onClick={() =>
            setForm((prev) => {
              const next = [...prev.ingredients, emptySectionRow()];
              setSectionFocusIndex(next.length - 1);
              return { ...prev, ingredients: next };
            })
          }
        >
          Add Section
        </button>
      </div>

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
            <button
              type="button"
              className="admin-action secondary"
              onClick={() => moveStep(index, -1)}
            >
              Up
            </button>
            <button
              type="button"
              className="admin-action secondary"
              onClick={() => moveStep(index, 1)}
            >
              Down
            </button>
            <button
              type="button"
              className="admin-action danger"
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
        className="admin-action success"
        onClick={() =>
          setForm((prev) => ({ ...prev, steps: [...prev.steps, emptyStepRow()] }))
        }
      >
        Add Step
      </button>

      <div className="inline-row">
        <button
          type="button"
          className="admin-action primary"
          onClick={handleSave}
          disabled={isSaving}
        >
          {isSaving ? "Saving..." : "Save Recipe"}
        </button>
        <button type="button" className="admin-action secondary" onClick={onCancel}>
          Close
        </button>
      </div>

      {null}
    </div>
  );
};

export default RecipeForm;
