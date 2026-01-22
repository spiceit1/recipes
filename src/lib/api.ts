import type {
  Comment,
  Ingredient,
  Measurement,
  Recipe,
  RecipePayload,
  RecipeSummary,
} from "./types";

const API_BASE = "/.netlify/functions";

type RequestOptions = RequestInit & {
  headers?: HeadersInit;
};

const request = async <T>(path: string, options: RequestOptions = {}): Promise<T | null> => {
  const response = await fetch(`${API_BASE}/${path}`, {
    headers: {
      "Content-Type": "application/json",
      ...(options.headers || {}),
    },
    ...options,
  });

  if (!response.ok) {
    const message = await response.text();
    throw new Error(message || "Request failed");
  }

  if (response.status === 204) {
    return null;
  }

  return response.json();
};

export const api = {
  getRecipes: (includeUnpublished = false) =>
    request<RecipeSummary[]>(`recipes?includeUnpublished=${includeUnpublished}`),
  searchRecipes: (query: string) =>
    request<RecipeSummary[]>(`search?q=${encodeURIComponent(query)}`),
  getRecipe: (id: string, includeUnpublished = false) =>
    request<Recipe>(`recipe?id=${id}&includeUnpublished=${includeUnpublished}`),
  createRecipe: (payload: RecipePayload) =>
    request<Recipe>("recipe", { method: "POST", body: JSON.stringify(payload) }),
  updateRecipe: (id: string, payload: RecipePayload) =>
    request<Recipe>(`recipe?id=${id}`, { method: "PUT", body: JSON.stringify(payload) }),
  deleteRecipe: (id: string) =>
    request<null>(`recipe?id=${id}`, { method: "DELETE" }),
  publishRecipe: (id: string, published: boolean) =>
    request<Recipe>("publish-recipe", {
      method: "POST",
      body: JSON.stringify({ id, published }),
    }),
  getIngredients: () => request<Ingredient[]>("ingredients"),
  getIngredientRecipes: (id: string) =>
    request<RecipeSummary[]>(`ingredient-recipes?id=${id}`),
  createIngredient: (payload: { name: string; caloriesPerUnit?: number }) =>
    request<Ingredient>("ingredients", { method: "POST", body: JSON.stringify(payload) }),
  updateIngredient: (id: string, payload: { name: string }) =>
    request<Ingredient>(`ingredients?id=${id}`, { method: "PUT", body: JSON.stringify(payload) }),
  deleteIngredient: (id: string) =>
    request<null>(`ingredients?id=${id}`, { method: "DELETE" }),
  getMeasurements: () => request<Measurement[]>("measurements"),
  createMeasurement: (payload: { name: string; conversionFactor?: number }) =>
    request<Measurement>("measurements", { method: "POST", body: JSON.stringify(payload) }),
  updateMeasurement: (id: string, payload: { name: string }) =>
    request<Measurement>(`measurements?id=${id}`, { method: "PUT", body: JSON.stringify(payload) }),
  deleteMeasurement: (id: string) =>
    request<null>(`measurements?id=${id}`, { method: "DELETE" }),
  uploadImage: (payload: {
    fileName: string;
    contentType: string;
    dataUrl: string | ArrayBuffer | null;
  }) => request<{ url?: string }>("image-upload", { method: "POST", body: JSON.stringify(payload) }),
  postComment: (payload: {
    recipeId: string;
    name: string;
    email: string;
    rating: number;
    comment: string;
  }) => request<Comment>("comments", { method: "POST", body: JSON.stringify(payload) }),
  getComments: () => request<Comment[]>("comments"),
  deleteComment: (id: string) =>
    request<null>(`comments?id=${id}`, { method: "DELETE" }),
};
