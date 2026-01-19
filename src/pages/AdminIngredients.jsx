import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import EmptyState from "../components/EmptyState.jsx";

const AdminIngredients = () => {
  const [ingredients, setIngredients] = useState([]);
  const [name, setName] = useState("");
  const [message, setMessage] = useState("");
  const [editingId, setEditingId] = useState("");
  const [editingName, setEditingName] = useState("");

  const load = async () => {
    const data = await api.getIngredients();
    setIngredients(data || []);
  };

  useEffect(() => {
    load();
  }, []);

  const handleCreate = async () => {
    const trimmed = name.trim();
    if (!trimmed) {
      return;
    }
    setMessage("");
    try {
      await api.createIngredient({
        name: trimmed,
        caloriesPerUnit: 0,
      });
      setName("");
      load();
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        setMessage("Already exists");
        return;
      }
      setMessage("Unable to add ingredient");
    }
  };

  const handleUpdate = async (id, field, value) => {
    const current = ingredients.find((item) => item.id === id);
    if (!current) {
      return;
    }
    await api.updateIngredient(id, {
      name: field === "name" ? value : current.name,
    });
    load();
  };
  const handleEdit = (item) => {
    setEditingId(item.id);
    setEditingName(item.name);
    setMessage("");
  };

  const handleSaveEdit = async () => {
    if (!editingId) {
      return;
    }
    const trimmed = editingName.trim();
    if (!trimmed) {
      return;
    }
    try {
      await handleUpdate(editingId, "name", trimmed);
      setEditingId("");
      setEditingName("");
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        setMessage("Already exists");
        return;
      }
      setMessage("Unable to update ingredient");
    }
  };

  const handleCancelEdit = () => {
    setEditingId("");
    setEditingName("");
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
            value={name}
            onChange={(event) => setName(event.target.value)}
          />
          <button type="button" onClick={handleCreate}>
            Add
          </button>
        </div>
        {message ? <div className="inline-message">{message}</div> : null}
      </div>
      {!ingredients.length ? (
        <EmptyState message="No ingredients yet" />
      ) : (
        <div className="admin-list">
          {ingredients.map((item) => (
            <div key={item.id} className="admin-card">
              {editingId === item.id ? (
                <div className="inline-row">
                  <input
                    type="text"
                    value={editingName}
                    onChange={(event) => setEditingName(event.target.value)}
                  />
                  <button type="button" onClick={handleSaveEdit}>
                    Save
                  </button>
                  <button type="button" onClick={handleCancelEdit}>
                    Cancel
                  </button>
                </div>
              ) : (
                <>
                  <div className="admin-text">{item.name}</div>
                  <div className="inline-row">
                    <button type="button" onClick={() => handleEdit(item)}>
                      Edit
                    </button>
                    <button type="button" onClick={() => handleDelete(item.id)}>
                      Delete
                    </button>
                  </div>
                </>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default AdminIngredients;
