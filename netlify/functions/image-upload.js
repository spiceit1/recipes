import { errorResponse, jsonResponse } from "./_utils/response.js";

export const handler = async (event) => {
  if (event.httpMethod !== "POST") {
    return errorResponse(405, "Method not allowed");
  }
  const payload = JSON.parse(event.body || "{}");
  if (!payload.dataUrl) {
    return errorResponse(400, "Missing image data");
  }
  return jsonResponse(200, { url: payload.dataUrl });
};
