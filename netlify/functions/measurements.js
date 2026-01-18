import { getPrisma } from "./_utils/prisma.js";
import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
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
    const measurement = await prisma.measurement.create({
      data: {
        name: payload.name,
        conversionFactor: Number(payload.conversionFactor || 0),
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
        conversionFactor: Number(payload.conversionFactor || 0),
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
