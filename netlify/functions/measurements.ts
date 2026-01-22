import type { Handler } from "@netlify/functions";
import { getPrisma } from "./_utils/prisma";
import { errorResponse, jsonResponse } from "./_utils/response";

export const handler: Handler = async (event) => {
  const prisma = getPrisma();
  const method = event.httpMethod;
  const id = event.queryStringParameters?.id;

  if (method === "GET") {
    const measurements = await prisma.measurement.findMany({
      orderBy: { name: "asc" },
    });
    return jsonResponse(200, measurements);
  }

  if (method === "POST") {
    const payload = JSON.parse(event.body || "{}");
    const name = (payload.name || "").trim();
    if (!name) {
      return errorResponse(400, "Missing name");
    }
    const existing = await prisma.measurement.findFirst({
      where: { name: { equals: name, mode: "insensitive" } },
    });
    if (existing) {
      return errorResponse(409, "Already exists");
    }
    const measurement = await prisma.measurement.create({
      data: {
        name,
      },
    });
    return jsonResponse(201, measurement);
  }

  if (method === "PUT") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    const payload = JSON.parse(event.body || "{}");
    const measurement = await prisma.measurement.update({
      where: { id },
      data: {
        name: payload.name,
      },
    });
    return jsonResponse(200, measurement);
  }

  if (method === "DELETE") {
    if (!id) {
      return errorResponse(400, "Missing id");
    }
    await prisma.measurement.delete({ where: { id } });
    return jsonResponse(204);
  }

  return errorResponse(405, "Method not allowed");
};
