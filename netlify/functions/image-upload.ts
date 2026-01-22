import type { Handler } from "@netlify/functions";
import { errorResponse, jsonResponse } from "./_utils/response";

export const handler: Handler = async (event) => {
  if (event.httpMethod !== "POST") {
    return errorResponse(405, "Method not allowed");
  }
  const payload = JSON.parse(event.body || "{}");
  if (!payload.dataUrl) {
    return errorResponse(400, "Missing image data");
  }
  return jsonResponse(200, { url: payload.dataUrl });
};
