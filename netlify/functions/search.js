import { getPrisma } from "./_utils/prisma.js";
import { jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  const prisma = getPrisma();
  const query = event.queryStringParameters?.q?.trim();
  if (!query) {
    return jsonResponse(200, []);
  }

  const recipes = await prisma.recipe.findMany({
    where: {
      published: true,
      OR: [
        { name: { contains: query, mode: "insensitive" } },
        { category: { contains: query, mode: "insensitive" } },
        {
          ingredients: {
            some: {
              ingredient: { name: { contains: query, mode: "insensitive" } },
            },
          },
        },
      ],
    },
    orderBy: { createdAt: "desc" },
    select: {
      id: true,
      name: true,
      category: true,
      totalTime: true,
      calories: true,
      imageUrl: true,
      published: true,
    },
  });

  return jsonResponse(200, recipes);
};
