import type { Handler } from "@netlify/functions";
import { getPrisma } from "./_utils/prisma";
import { jsonResponse } from "./_utils/response";

export const handler: Handler = async (event) => {
  const prisma = getPrisma();
  const includeUnpublished = event.queryStringParameters?.includeUnpublished === "true";

  const recipes = await prisma.recipe.findMany({
    where: includeUnpublished ? {} : { published: true },
    orderBy: { createdAt: "desc" },
    select: {
      id: true,
      name: true,
      category: true,
      totalTime: true,
      imageUrl: true,
      published: true,
    },
  });

  return jsonResponse(200, recipes);
};
