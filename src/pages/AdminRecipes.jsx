import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import RecipeForm from "../components/RecipeForm.jsx";

const AdminRecipes = () => {
  const [recipes, setRecipes] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [activeRecipe, setActiveRecipe] = useState(null);

  const loadRecipes = async () => {
    setIsLoading(true);
    try {
      const data = await api.getRecipes(true);
      setRecipes(data || []);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    loadRecipes();
  }, []);

  const openAdd = () => {
    setActiveRecipe(null);
    setModalOpen(true);
  };

  const openEdit = async (id) => {
    const data = await api.getRecipe(id, true);
    setActiveRecipe(data);
    setModalOpen(true);
  };

  const closeModal = () => {
    setModalOpen(false);
    setActiveRecipe(null);
  };

  const handleSave = async (payload) => {
    if (activeRecipe?.id) {
      await api.updateRecipe(activeRecipe.id, payload);
    } else {
      await api.createRecipe(payload);
    }
    closeModal();
    loadRecipes();
  };

  const handleDelete = async (id) => {
    await api.deleteRecipe(id);
    loadRecipes();
  };

  const handleToggle = async (id, published) => {
    await api.publishRecipe(id, published);
    loadRecipes();
  };

  const handleRecalc = async () => {
    if (!activeRecipe?.id) {
      return;
    }
    await api.recalcCalories(activeRecipe.id);
    const data = await api.getRecipe(activeRecipe.id, true);
    setActiveRecipe(data);
    loadRecipes();
  };

  if (isLoading) {
    return <div className="empty-state">Loading...</div>;
  }

  return (
    <div className="admin-page">
      <div className="admin-header-row">
        <h1>Recipes</h1>
        <button type="button" className="admin-button" onClick={openAdd}>
          Add Recipe
        </button>
      </div>

      {!recipes.length ? (
        <div className="empty-state">No recipes yet</div>
      ) : (
        <div className="admin-list">
          {recipes.map((recipe) => (
            <div key={recipe.id} className="admin-card admin-recipe-card">
              <div className="admin-recipe-left">
                <div className="admin-thumb">
                  {recipe.imageUrl ? (
                    <img src={recipe.imageUrl} alt={recipe.name} loading="lazy" />
                  ) : (
                    <div className="image-placeholder" />
                  )}
                </div>
                <div>
                  <div className="admin-title">{recipe.name}</div>
                  <div className="tiny-text">{recipe.category}</div>
                </div>
              </div>
              <div className="admin-actions">
                <button type="button" onClick={() => openEdit(recipe.id)}>
                  Edit
                </button>
                <button type="button" onClick={() => handleDelete(recipe.id)}>
                  Delete
                </button>
                <button
                  type="button"
                  onClick={() => handleToggle(recipe.id, !recipe.published)}
                >
                  {recipe.published ? "Unpublish" : "Publish"}
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {modalOpen ? (
        <div className="modal-backdrop" role="presentation">
          <div className="modal modal-wide" role="dialog" aria-modal="true">
            <div className="modal-header">
              <h2>{activeRecipe ? "Edit Recipe" : "Add Recipe"}</h2>
              <button type="button" className="modal-close" onClick={closeModal}>
                ✕
              </button>
            </div>
            <RecipeForm
              recipe={activeRecipe}
              onSave={handleSave}
              onCancel={closeModal}
              onRecalc={activeRecipe ? handleRecalc : null}
            />
          </div>
        </div>
      ) : null}
    </div>
  );
};

export default AdminRecipes;
