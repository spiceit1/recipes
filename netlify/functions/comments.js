import { getPrisma } from "./_utils/prisma.js";
import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  const prisma = getPrisma();
  const method = event.httpMethod;
  const id = event.queryStringParameters?.id;

  if (method === "GET") {
    const comments = await prisma.comment.findMany({
      orderBy: { createdAt: "desc" },
      include: { recipe: true },
    });
    return jsonResponse(200, comments);
  }

  if (method === "POST") {
    const payload = JSON.parse(event.body || "{}");
    if (!payload.name || !payload.email || !payload.rating) {
      return errorResponse(400, "Missing required fields");
    }
    const comment = await prisma.comment.create({
      data: {
        recipeId: payload.recipeId,
        name: payload.name,
        email: payload.email,
        rating: Number(payload.rating || 0),
        comment: payload.comment,
      },
    });
    return jsonResponse(201, comment);
  }

  if (method === "DELETE") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    await prisma.comment.delete({ where: { id } });
    return jsonResponse(204);
  }

  return errorResponse(405, "Method not allowed");
};
