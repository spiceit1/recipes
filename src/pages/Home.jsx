import { useEffect, useMemo, useState } from "react";
import { api } from "../lib/api.js";
import RecipeCard from "../components/RecipeCard.jsx";
import RecipeFilters from "../components/RecipeFilters.jsx";
import EmptyState from "../components/EmptyState.jsx";
import { EMPTY_MESSAGE } from "../lib/constants.js";

const Home = ({ searchQuery }) => {
  const [recipes, setRecipes] = useState([]);
  const [activeCategory, setActiveCategory] = useState("");
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    let isMounted = true;
    const load = async () => {
      setIsLoading(true);
      try {
        const data = searchQuery
          ? await api.searchRecipes(searchQuery)
          : await api.getRecipes(false);
        if (isMounted) {
          setRecipes(data || []);
        }
      } catch (error) {
        if (isMounted) {
          setRecipes([]);
        }
      } finally {
        if (isMounted) {
          setIsLoading(false);
        }
      }
    };
    load();
    return () => {
      isMounted = false;
    };
  }, [searchQuery]);

  const visibleRecipes = useMemo(() => {
    if (!activeCategory) {
      return recipes;
    }
    return recipes.filter((recipe) => recipe.category === activeCategory);
  }, [recipes, activeCategory]);

  return (
    <section className="home-page">
      <RecipeFilters
        activeCategory={activeCategory}
        onChange={setActiveCategory}
      />
      {isLoading ? (
        <div className="empty-state">Loading...</div>
      ) : visibleRecipes.length ? (
        <div className="recipe-grid">
          {visibleRecipes.map((recipe) => (
            <RecipeCard key={recipe.id} recipe={recipe} />
          ))}
        </div>
      ) : (
        <EmptyState message={EMPTY_MESSAGE} />
      )}
    </section>
  );
};

export default Home;
