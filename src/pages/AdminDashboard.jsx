import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { api } from "../lib/api.js";
import EmptyState from "../components/EmptyState.jsx";

const AdminDashboard = () => {
  const [recipes, setRecipes] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const navigate = useNavigate();

  const load = async () => {
    setIsLoading(true);
    try {
      const data = await api.getRecipes(true);
      setRecipes(data || []);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const handleDelete = async (id) => {
    await api.deleteRecipe(id);
    load();
  };

  const handleToggle = async (id, published) => {
    await api.publishRecipe(id, published);
    load();
  };

  if (isLoading) {
    return <div className="empty-state">Loading...</div>;
  }

  if (!recipes.length) {
    return <EmptyState message="No recipes yet" />;
  }

  return (
    <div className="admin-page">
      <h1>Recipes</h1>
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
              <button
                type="button"
                className="admin-action"
                onClick={() => navigate(`/admin/recipes/${recipe.id}`)}
              >
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
    </div>
  );
};

export default AdminDashboard;
