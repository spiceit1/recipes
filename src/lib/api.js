const API_BASE = "/.netlify/functions";

const request = async (path, options = {}) => {
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
    request(`recipes?includeUnpublished=${includeUnpublished}`),
  searchRecipes: (query) => request(`search?q=${encodeURIComponent(query)}`),
  getRecipe: (id, includeUnpublished = false) =>
    request(`recipe?id=${id}&includeUnpublished=${includeUnpublished}`),
  createRecipe: (payload) =>
    request("recipe", { method: "POST", body: JSON.stringify(payload) }),
  updateRecipe: (id, payload) =>
    request(`recipe?id=${id}`, { method: "PUT", body: JSON.stringify(payload) }),
  deleteRecipe: (id) => request(`recipe?id=${id}`, { method: "DELETE" }),
  publishRecipe: (id, published) =>
    request("publish-recipe", {
      method: "POST",
      body: JSON.stringify({ id, published }),
    }),
  getIngredients: () => request("ingredients"),
  getIngredientRecipes: (id) => request(`ingredient-recipes?id=${id}`),
  createIngredient: (payload) =>
    request("ingredients", { method: "POST", body: JSON.stringify(payload) }),
  updateIngredient: (id, payload) =>
    request(`ingredients?id=${id}`, { method: "PUT", body: JSON.stringify(payload) }),
  deleteIngredient: (id) => request(`ingredients?id=${id}`, { method: "DELETE" }),
  getMeasurements: () => request("measurements"),
  createMeasurement: (payload) =>
    request("measurements", { method: "POST", body: JSON.stringify(payload) }),
  updateMeasurement: (id, payload) =>
    request(`measurements?id=${id}`, { method: "PUT", body: JSON.stringify(payload) }),
  deleteMeasurement: (id) => request(`measurements?id=${id}`, { method: "DELETE" }),
  uploadImage: (payload) =>
    request("image-upload", { method: "POST", body: JSON.stringify(payload) }),
  postComment: (payload) =>
    request("comments", { method: "POST", body: JSON.stringify(payload) }),
  getComments: () => request("comments"),
  deleteComment: (id) => request(`comments?id=${id}`, { method: "DELETE" }),
};
