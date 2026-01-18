import { getPrisma } from "./_utils/prisma.js";
import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  if (event.httpMethod !== "POST") {
    return errorResponse(405, "Method not allowed");
  }
  const prisma = getPrisma();
  const payload = JSON.parse(event.body || "{}");
  if (!payload.id) {
    return errorResponse(400, "Missing id");
  }

  const recipe = await prisma.recipe.update({
    where: { id: payload.id },
    data: { published: Boolean(payload.published) },
  });

  return jsonResponse(200, recipe);
};
