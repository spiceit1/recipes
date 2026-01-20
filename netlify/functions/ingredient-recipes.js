import { getPrisma } from "./_utils/prisma.js";
import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  const prisma = getPrisma();
  if (event.httpMethod !== "GET") {
    return errorResponse(405, "Method not allowed");
  }
  const id = event.queryStringParameters?.id;
  if (!id) {
    return errorResponse(400, "Missing id");
  }

  const recipes = await prisma.recipe.findMany({
    where: {
      ingredients: {
        some: { ingredientId: id },
      },
    },
    select: {
      id: true,
      name: true,
      category: true,
      imageUrl: true,
      published: true,
    },
    orderBy: { createdAt: "desc" },
  });

  return jsonResponse(200, recipes);
};
