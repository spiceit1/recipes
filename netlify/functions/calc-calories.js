import { getPrisma } from "./_utils/prisma.js";
import { calculateCalories } from "./_utils/calcCalories.js";
import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  if (event.httpMethod !== "POST") {
    return errorResponse(405, "Method not allowed");
  }
  const prisma = getPrisma();
  const payload = JSON.parse(event.body || "{}");
  if (!payload.recipeId) {
    return errorResponse(400, "Missing recipeId");
  }

  const ingredients = await prisma.recipeIngredient.findMany({
    where: { recipeId: payload.recipeId },
    include: { ingredient: true, measurement: true },
  });
  const total = calculateCalories(ingredients);
  const recipe = await prisma.recipe.update({
    where: { id: payload.recipeId },
    data: { calories: Math.round(total) },
  });

  return jsonResponse(200, recipe);
};
