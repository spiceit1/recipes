-- Add Teriyaki Salmon recipe from iCloud Notes and correct Beef Chili stock quantity.
-- Idempotent inserts allow this to be safely retried by Netlify/Prisma.

INSERT INTO "Measurement" ("id", "name", "createdAt", "updatedAt") VALUES
  ('meas_cups', 'cups', NOW(), NOW()),
  ('meas_fillets', 'fillets', NOW(), NOW()),
  ('meas_lemon', 'lemon', NOW(), NOW()),
  ('meas_cloves', 'cloves', NOW(), NOW()),
  ('meas_tbsp', 'tbsp', NOW(), NOW())
ON CONFLICT ("name") DO UPDATE SET "updatedAt" = EXCLUDED."updatedAt";

INSERT INTO "Ingredient" ("id", "name", "createdAt", "updatedAt") VALUES
  ('ing_chicken_stock', 'chicken stock', NOW(), NOW()),
  ('ing_wild_salmon', 'wild salmon', NOW(), NOW()),
  ('ing_teriyaki_sauce', 'teriyaki sauce', NOW(), NOW()),
  ('ing_soy_sauce', 'soy sauce', NOW(), NOW()),
  ('ing_dijon_mustard', 'Dijon mustard', NOW(), NOW()),
  ('ing_honey', 'honey', NOW(), NOW()),
  ('ing_lemon_juice', 'lemon juice', NOW(), NOW()),
  ('ing_garlic_minced', 'garlic, minced', NOW(), NOW()),
  ('ing_black_white_sesame_seeds', 'black and white sesame seeds', NOW(), NOW())
ON CONFLICT ("name") DO UPDATE SET "updatedAt" = EXCLUDED."updatedAt";

-- Correct the prior Beef Chili ingredient line to display as “2 cups chicken stock”.
UPDATE "RecipeIngredient"
SET
  "ingredientId" = (SELECT "id" FROM "Ingredient" WHERE "name" = 'chicken stock'),
  "measurementId" = (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'),
  "amount" = 2,
  "updatedAt" = NOW()
WHERE "id" = 'ri_beef_chili_stock';

UPDATE "InstructionStep"
SET
  "text" = 'Add the diced tomatoes, 2 cups chicken stock, red kidney beans, black beans, and bay leaf. Stir to combine, scraping up any browned bits from the bottom of the pot.',
  "updatedAt" = NOW()
WHERE "id" = 'step_beef_chili_5';

UPDATE "InstructionStep"
SET
  "text" = 'Bring to a simmer, then reduce the heat to low. Simmer uncovered for 45-60 minutes, stirring occasionally, until the chili thickens and the flavors come together.',
  "updatedAt" = NOW()
WHERE "id" = 'step_beef_chili_6';

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_teriyaki_salmon', 'Teriyaki Salmon', 'Parve', 10, 25, 35, 2, NULL, true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_teriyaki_salmon_salmon', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'wild salmon'), (SELECT "id" FROM "Measurement" WHERE "name" = 'fillets'), 2, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_teriyaki', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'teriyaki sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_soy', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'soy sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_mustard', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Dijon mustard'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_honey', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_lemon', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lemon juice'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lemon'), 1, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_garlic', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 5, NULL, NOW(), NOW()),
  ('ri_teriyaki_salmon_sesame', 'recipe_teriyaki_salmon', (SELECT "id" FROM "Ingredient" WHERE "name" = 'black and white sesame seeds'), NULL, 0, NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_teriyaki_salmon_1', 'recipe_teriyaki_salmon', 1, 'Preheat the oven to 400°F. Line a baking sheet with parchment or lightly grease a baking dish.', NULL, NOW(), NOW()),
  ('step_teriyaki_salmon_2', 'recipe_teriyaki_salmon', 2, 'In a bowl, whisk together the teriyaki sauce, soy sauce, Dijon mustard, honey, lemon juice, and minced garlic until smooth.', NULL, NOW(), NOW()),
  ('step_teriyaki_salmon_3', 'recipe_teriyaki_salmon', 3, 'Place the salmon fillets in the baking dish and coat them well with the sauce. Marinate briefly while the oven heats, or up to 30 minutes if time allows.', NULL, NOW(), NOW()),
  ('step_teriyaki_salmon_4', 'recipe_teriyaki_salmon', 4, 'Sprinkle the salmon with black and white sesame seeds. Bake for 23-25 minutes, until the salmon flakes easily with a fork.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();
