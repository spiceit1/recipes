import { useEffect, useMemo, useState } from "react";
import { api } from "../lib/api";
import RecipeCard from "../components/RecipeCard";
import RecipeFilters from "../components/RecipeFilters";
import EmptyState from "../components/EmptyState";
import { CATEGORIES, EMPTY_MESSAGE } from "../lib/constants";
import type { RecipeSummary } from "../lib/types";

type HomeProps = {
  searchQuery: string;
};

const Home = ({ searchQuery }: HomeProps) => {
  const [recipes, setRecipes] = useState<RecipeSummary[]>([]);
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

  const groupedRecipes = useMemo(() => {
    if (activeCategory) {
      return [];
    }
    const groups = CATEGORIES.map((category) => ({
      category,
      items: recipes.filter((recipe) => recipe.category === category),
    })).filter((group) => group.items.length);
    const uncategorized = recipes.filter(
      (recipe) => !recipe.category || !CATEGORIES.includes(recipe.category)
    );
    if (uncategorized.length) {
      groups.push({ category: "Uncategorized", items: uncategorized });
    }
    return groups;
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
        activeCategory ? (
          <div className="recipe-grid">
            {visibleRecipes.map((recipe) => (
              <RecipeCard key={recipe.id} recipe={recipe} />
            ))}
          </div>
        ) : (
          <div className="recipe-sections">
            {groupedRecipes.map((group) => (
              <section key={group.category} className="recipe-section">
                <h2>{group.category}</h2>
                <div className="recipe-grid">
                  {group.items.map((recipe) => (
                    <RecipeCard key={recipe.id} recipe={recipe} />
                  ))}
                </div>
              </section>
            ))}
          </div>
        )
      ) : (
        <EmptyState message={EMPTY_MESSAGE} />
      )}
    </section>
  );
};

export default Home;
