import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import EmptyState from "../components/EmptyState.jsx";

const AdminIngredients = () => {
  const [ingredients, setIngredients] = useState([]);
  const [form, setForm] = useState({ name: "", caloriesPerUnit: "" });

  const load = async () => {
    const data = await api.getIngredients();
    setIngredients(data || []);
  };

  useEffect(() => {
    load();
  }, []);

  const handleCreate = async () => {
    if (!form.name) {
      return;
    }
    await api.createIngredient({
      name: form.name,
      caloriesPerUnit: Number(form.caloriesPerUnit || 0),
    });
    setForm({ name: "", caloriesPerUnit: "" });
    load();
  };

  const handleUpdate = async (id, field, value) => {
    const current = ingredients.find((item) => item.id === id);
    if (!current) {
      return;
    }
    await api.updateIngredient(id, {
      name: field === "name" ? value : current.name,
      caloriesPerUnit:
        field === "caloriesPerUnit"
          ? Number(value || 0)
          : current.caloriesPerUnit,
    });
    load();
  };

  const handleDelete = async (id) => {
    await api.deleteIngredient(id);
    load();
  };

  return (
    <div className="admin-page">
      <h1>Ingredients</h1>
      <div className="admin-form">
        <div className="inline-row">
          <input
            type="text"
            value={form.name}
            onChange={(event) =>
              setForm((prev) => ({ ...prev, name: event.target.value }))
            }
          />
          <input
            type="number"
            value={form.caloriesPerUnit}
            onChange={(event) =>
              setForm((prev) => ({
                ...prev,
                caloriesPerUnit: event.target.value,
              }))
            }
          />
          <button type="button" onClick={handleCreate}>
            Add
          </button>
        </div>
      </div>
      {!ingredients.length ? (
        <EmptyState message="No ingredients yet" />
      ) : (
        <div className="admin-list">
          {ingredients.map((item) => (
            <div key={item.id} className="admin-card">
              <input
                type="text"
                value={item.name}
                onChange={(event) =>
                  setIngredients((prev) =>
                    prev.map((ingredient) =>
                      ingredient.id === item.id
                        ? { ...ingredient, name: event.target.value }
                        : ingredient
                    )
                  )
                }
                onBlur={(event) => handleUpdate(item.id, "name", event.target.value)}
              />
              <input
                type="number"
                value={item.caloriesPerUnit}
                onChange={(event) =>
                  setIngredients((prev) =>
                    prev.map((ingredient) =>
                      ingredient.id === item.id
                        ? { ...ingredient, caloriesPerUnit: event.target.value }
                        : ingredient
                    )
                  )
                }
                onBlur={(event) =>
                  handleUpdate(item.id, "caloriesPerUnit", event.target.value)
                }
              />
              <button type="button" onClick={() => handleDelete(item.id)}>
                Delete
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default AdminIngredients;
