import type { HandlerResponse } from "@netlify/functions";

export const jsonResponse = (statusCode: number, body?: unknown): HandlerResponse => ({
  statusCode,
  headers: {
    "Content-Type": "application/json",
  },
  body: body === undefined ? "" : JSON.stringify(body),
});

export const errorResponse = (statusCode: number, message: string): HandlerResponse =>
  jsonResponse(statusCode, { error: message });
