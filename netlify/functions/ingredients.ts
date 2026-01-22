import type { Handler } from "@netlify/functions";
import { getPrisma } from "./_utils/prisma";
import { errorResponse, jsonResponse } from "./_utils/response";

export const handler: Handler = async (event) => {
  const prisma = getPrisma();
  const method = event.httpMethod;
  const id = event.queryStringParameters?.id;

  if (method === "GET") {
    const ingredients = await prisma.ingredient.findMany({
      orderBy: { name: "asc" },
      include: {
        _count: {
          select: { recipeIngredients: true },
        },
      },
    });
    const response = ingredients.map((ingredient) => ({
      ...ingredient,
      recipeCount: ingredient._count?.recipeIngredients || 0,
    }));
    return jsonResponse(200, response);
  }

  if (method === "POST") {
    const payload = JSON.parse(event.body || "{}");
    const name = (payload.name || "").trim();
    if (!name) {
      return errorResponse(400, "Missing name");
    }
    const existing = await prisma.ingredient.findFirst({
      where: { name: { equals: name, mode: "insensitive" } },
    });
    if (existing) {
      return errorResponse(409, "Already exists");
    }
    const ingredient = await prisma.ingredient.create({
      data: {
        name,
      },
    });
    return jsonResponse(201, ingredient);
  }

  if (method === "PUT") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    const payload = JSON.parse(event.body || "{}");
    const ingredient = await prisma.ingredient.update({
      where: { id },
      data: {
        name: payload.name,
      },
    });
    return jsonResponse(200, ingredient);
  }

  if (method === "DELETE") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    await prisma.ingredient.delete({ where: { id } });
    return jsonResponse(204);
  }

  return errorResponse(405, "Method not allowed");
};
