-- Ensure the older Blueberry Crisp record uses the durable public image asset instead of an inline data URI.
UPDATE "Recipe"
SET "imageUrl" = '/recipe-images/blueberry-crisp.jpg',
    "updatedAt" = CURRENT_TIMESTAMP
WHERE "id" = 'cmkr6hrnf000011ybye3elweu'
  AND "name" = 'Blueberry Crisp';
