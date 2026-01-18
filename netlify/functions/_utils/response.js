export const jsonResponse = (statusCode, body) => ({
  statusCode,
  headers: {
    "Content-Type": "application/json",
  },
  body: body === undefined ? "" : JSON.stringify(body),
});

export const errorResponse = (statusCode, message) =>
  jsonResponse(statusCode, { error: message });
