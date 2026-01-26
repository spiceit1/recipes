import type { RecipeSummary } from "./types";

const recipeCache = new Map<string, RecipeSummary[]>();

export const getCachedRecipes = (key: string) => {
  const cached = recipeCache.get(key);
  return cached ? [...cached] : null;
};

export const setCachedRecipes = (key: string, recipes: RecipeSummary[]) => {
  recipeCache.set(key, [...recipes]);
};
