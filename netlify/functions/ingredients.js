import { getPrisma } from "./_utils/prisma.js";
import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  const prisma = getPrisma();
  const method = event.httpMethod;
  const id = event.queryStringParameters?.id;

  if (method === "GET") {
    const ingredients = await prisma.ingredient.findMany({
      orderBy: { name: "asc" },
    });
    return jsonResponse(200, ingredients);
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
        caloriesPerUnit: Number(payload.caloriesPerUnit || 0),
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
        caloriesPerUnit: Number(payload.caloriesPerUnit || 0),
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
