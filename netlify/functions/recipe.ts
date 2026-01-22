import type { Handler } from "@netlify/functions";
import { getPrisma } from "./_utils/prisma";
import { errorResponse, jsonResponse } from "./_utils/response";

export const handler: Handler = async (event) => {
  const prisma = getPrisma();
  const method = event.httpMethod;
  const id = event.queryStringParameters?.id;

  if (method === "GET") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    const includeUnpublished =
      event.queryStringParameters?.includeUnpublished === "true";
    const recipe = await prisma.recipe.findFirst({
      where: includeUnpublished ? { id } : { id, published: true },
      include: {
        ingredients: {
          include: {
            ingredient: true,
            measurement: true,
          },
        },
        steps: true,
      },
    });
    if (!recipe) {
      return errorResponse(404, "Not found");
    }
    return jsonResponse(200, recipe);
  }

  if (method === "POST") {
    const payload = JSON.parse(event.body || "{}");
    const totalTime = Number(payload.prepTime || 0) + Number(payload.cookTime || 0);

    const recipe = await prisma.recipe.create({
      data: {
        name: payload.name,
        category: payload.category,
        prepTime: Number(payload.prepTime || 0),
        cookTime: Number(payload.cookTime || 0),
        totalTime,
        serves: Number(payload.serves || 1),
        imageUrl: payload.imageUrl || null,
        ingredients: {
          create: (payload.ingredients || []).map((item) => ({
            ingredientId: item.ingredientId,
            measurementId: item.measurementId || null,
            amount: Number(item.amount || 0),
          })),
        },
        steps: {
          create: (payload.steps || []).map((step) => ({
            text: step.text,
            imageUrl: step.imageUrl || null,
            stepNumber: step.stepNumber,
          })),
        },
      },
    });
    return jsonResponse(201, recipe);
  }

  if (method === "PUT") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    const payload = JSON.parse(event.body || "{}");
    const totalTime = Number(payload.prepTime || 0) + Number(payload.cookTime || 0);

    await prisma.recipeIngredient.deleteMany({ where: { recipeId: id } });
    await prisma.instructionStep.deleteMany({ where: { recipeId: id } });

    const recipe = await prisma.recipe.update({
      where: { id },
      data: {
        name: payload.name,
        category: payload.category,
        prepTime: Number(payload.prepTime || 0),
        cookTime: Number(payload.cookTime || 0),
        totalTime,
        serves: Number(payload.serves || 1),
        imageUrl: payload.imageUrl || null,
        ingredients: {
          create: (payload.ingredients || []).map((item) => ({
            ingredientId: item.ingredientId,
            measurementId: item.measurementId || null,
            amount: Number(item.amount || 0),
          })),
        },
        steps: {
          create: (payload.steps || []).map((step) => ({
            text: step.text,
            imageUrl: step.imageUrl || null,
            stepNumber: step.stepNumber,
          })),
        },
      },
    });

    return jsonResponse(200, recipe);
  }

  if (method === "DELETE") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    await prisma.recipe.delete({ where: { id } });
    return jsonResponse(204);
  }

  return errorResponse(405, "Method not allowed");
};
