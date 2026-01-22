import { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { api } from "../lib/api";
import ConfirmModal from "../components/ConfirmModal";
import EmptyState from "../components/EmptyState";
import type { Ingredient, RecipeSummary } from "../lib/types";

const AdminIngredients = () => {
  const [ingredients, setIngredients] = useState<Ingredient[]>([]);
  const [name, setName] = useState("");
  const [message, setMessage] = useState("");
  const [editingId, setEditingId] = useState("");
  const [editingName, setEditingName] = useState("");
  const [pendingDelete, setPendingDelete] = useState<{ id: string; name: string } | null>(
    null
  );
  const [recipeModal, setRecipeModal] = useState<{
    open: boolean;
    ingredientName: string;
    recipes: RecipeSummary[];
  }>({
    open: false,
    ingredientName: "",
    recipes: [],
  });

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

  const handleUpdate = async (id: string, field: "name", value: string) => {
    const current = ingredients.find((item) => item.id === id);
    if (!current) {
      return;
    }
    await api.updateIngredient(id, {
      name: field === "name" ? value : current.name,
    });
    load();
  };
  const handleEdit = (item: Ingredient) => {
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


  const handleDelete = async (item: Ingredient) => {
    setPendingDelete({ id: item.id, name: item.name });
  };

  const confirmDelete = async () => {
    if (!pendingDelete?.id) {
      return;
    }
    await api.deleteIngredient(pendingDelete.id);
    setPendingDelete(null);
    load();
  };

  const openRecipeModal = async (ingredient: Ingredient) => {
    const data = await api.getIngredientRecipes(ingredient.id);
    setRecipeModal({
      open: true,
      ingredientName: ingredient.name,
      recipes: data || [],
    });
  };

  const closeRecipeModal = () => {
    setRecipeModal({ open: false, ingredientName: "", recipes: [] });
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
                  <div className="admin-text">
                    {item.name}
                    {item.recipeCount > 0 ? (
                      <button
                        type="button"
                        className="recipe-count-link"
                        onClick={() => openRecipeModal(item)}
                      >
                        {item.recipeCount}{" "}
                        {item.recipeCount === 1 ? "recipe" : "recipes"}
                      </button>
                    ) : null}
                  </div>
                  <div className="inline-row">
                    <button type="button" onClick={() => handleEdit(item)}>
                      Edit
                    </button>
                    <button type="button" onClick={() => handleDelete(item)}>
                      Delete
                    </button>
                  </div>
                </>
              )}
            </div>
          ))}
        </div>
      )}
      {recipeModal.open ? (
        <div className="modal-backdrop" role="presentation">
          <div className="modal" role="dialog" aria-modal="true">
            <div className="modal-header">
              <h3>{recipeModal.ingredientName} recipes</h3>
              <button type="button" className="modal-close" onClick={closeRecipeModal}>
                ✕
              </button>
            </div>
            {recipeModal.recipes.length ? (
              <div className="modal-list">
                {recipeModal.recipes.map((recipe) => (
                  <div key={recipe.id} className="modal-link">
                    <div>
                      <div>{recipe.name}</div>
                      <div className="tiny-text">{recipe.category}</div>
                    </div>
                    <div className="inline-row">
                      {recipe.published ? (
                        <Link
                          to={`/recipe/${recipe.id}?customerView=1`}
                          className="modal-action"
                          onClick={closeRecipeModal}
                        >
                          View
                        </Link>
                      ) : (
                        <span className="modal-unpublished">Unpublished</span>
                      )}
                      <Link
                        to={`/admin?editRecipe=${recipe.id}`}
                        className="modal-action"
                        onClick={closeRecipeModal}
                      >
                        Edit
                      </Link>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="tiny-text">No recipes yet.</div>
            )}
          </div>
        </div>
      ) : null}
      {pendingDelete ? (
        <ConfirmModal
          title={`Delete "${pendingDelete.name}"?`}
          message="This will remove the ingredient permanently."
          confirmLabel="Delete"
          onCancel={() => setPendingDelete(null)}
          onConfirm={confirmDelete}
        />
      ) : null}
    </div>
  );
};

export default AdminIngredients;
