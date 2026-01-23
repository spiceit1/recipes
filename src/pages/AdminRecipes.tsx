import { useEffect, useState } from "react";
import { toast } from "react-hot-toast";
import { useSearchParams } from "react-router-dom";
import { api } from "../lib/api";
import ConfirmModal from "../components/ConfirmModal";
import RecipeForm from "../components/RecipeForm";
import type { Recipe, RecipePayload, RecipeSummary } from "../lib/types";

const AdminRecipes = () => {
  const [recipes, setRecipes] = useState<RecipeSummary[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [modalOpen, setModalOpen] = useState(false);
  const [activeRecipe, setActiveRecipe] = useState<Recipe | null>(null);
  const [pendingDelete, setPendingDelete] = useState<{ id: string; name: string } | null>(
    null
  );
  const [searchParams, setSearchParams] = useSearchParams();

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

  useEffect(() => {
    const editId = searchParams.get("editRecipe");
    if (!editId) {
      return;
    }
    openEdit(editId).finally(() => {
      setSearchParams((params) => {
        params.delete("editRecipe");
        return params;
      });
    });
  }, [searchParams, setSearchParams]);

  const openAdd = () => {
    setActiveRecipe(null);
    setModalOpen(true);
  };

  const openEdit = async (id: string) => {
    const data = await api.getRecipe(id, true);
    setActiveRecipe(data);
    setModalOpen(true);
  };

  const closeModal = () => {
    setModalOpen(false);
    setActiveRecipe(null);
  };

  const handleSave = async (payload: RecipePayload) => {
    if (activeRecipe?.id) {
      await api.updateRecipe(activeRecipe.id, payload);
      toast.success("Recipe updated.");
    } else {
      await api.createRecipe(payload);
      toast.success("Recipe created.");
    }
    closeModal();
    loadRecipes();
  };

  const handleDelete = async (recipe: RecipeSummary) => {
    setPendingDelete({ id: recipe.id, name: recipe.name });
  };

  const confirmDelete = async () => {
    if (!pendingDelete?.id) {
      return;
    }
    await api.deleteRecipe(pendingDelete.id);
    setPendingDelete(null);
    toast.success("Recipe deleted.");
    loadRecipes();
  };

  const handleToggle = async (id: string, published: boolean) => {
    const previous = recipes.find((recipe) => recipe.id === id);
    setRecipes((prev) =>
      prev.map((recipe) => (recipe.id === id ? { ...recipe, published } : recipe))
    );
    try {
      const updated = await api.publishRecipe(id, published);
      setRecipes((prev) =>
        prev.map((recipe) =>
          recipe.id === id
            ? { ...recipe, published: updated?.published ?? published }
            : recipe
        )
      );
      toast.success(published ? "Recipe activated." : "Recipe deactivated.");
    } catch (error) {
      setRecipes((prev) =>
        prev.map((recipe) =>
          recipe.id === id
            ? { ...recipe, published: previous?.published ?? !published }
            : recipe
        )
      );
      toast.error("Unable to update recipe status.");
    }
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
                <button type="button" onClick={() => handleDelete(recipe)}>
                  Delete
                </button>
                <label className="toggle-switch">
                  <input
                    type="checkbox"
                    checked={Boolean(recipe.published)}
                    onChange={(event) => handleToggle(recipe.id, event.target.checked)}
                  />
                  <span className="toggle-text">
                    {recipe.published ? "Active" : "Inactive"}
                  </span>
                </label>
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
            />
          </div>
        </div>
      ) : null}
      {pendingDelete ? (
        <ConfirmModal
          title={`Delete "${pendingDelete.name}"?`}
          message="This will remove the recipe permanently."
          confirmLabel="Delete"
          onCancel={() => setPendingDelete(null)}
          onConfirm={confirmDelete}
        />
      ) : null}
    </div>
  );
};

export default AdminRecipes;
