-- Add Beef Chili recipe from Douglas's ingredient screenshot.
-- Idempotent inserts allow the migration to be safe if partially applied/retried.

INSERT INTO "Measurement" ("id", "name", "createdAt", "updatedAt") VALUES
  ('meas_pounds', 'pounds', NOW(), NOW()),
  ('meas_medium', 'medium', NOW(), NOW()),
  ('meas_cloves', 'cloves', NOW(), NOW()),
  ('meas_tbsp', 'tbsp', NOW(), NOW()),
  ('meas_tsp', 'tsp', NOW(), NOW()),
  ('meas_10_oz_can', '10-oz can', NOW(), NOW()),
  ('meas_15_oz_can', '15-oz can', NOW(), NOW())
ON CONFLICT ("name") DO UPDATE SET "updatedAt" = EXCLUDED."updatedAt";

INSERT INTO "Ingredient" ("id", "name", "createdAt", "updatedAt") VALUES
  ('ing_oil_to_coat_pot', 'Oil to coat pot', NOW(), NOW()),
  ('ing_ground_beef', 'ground beef', NOW(), NOW()),
  ('ing_onion_diced', 'onion, diced', NOW(), NOW()),
  ('ing_jalapeno_diced', 'jalapeño, diced', NOW(), NOW()),
  ('ing_garlic_minced', 'garlic, minced', NOW(), NOW()),
  ('ing_tomato_paste', 'tomato paste', NOW(), NOW()),
  ('ing_chili_powder', 'chili powder', NOW(), NOW()),
  ('ing_cumin', 'cumin', NOW(), NOW()),
  ('ing_garlic_powder', 'garlic powder', NOW(), NOW()),
  ('ing_salt_and_pepper', 'Salt and pepper', NOW(), NOW()),
  ('ing_diced_tomatoes', 'diced tomatoes', NOW(), NOW()),
  ('ing_chicken_stock_range', '1-2 cups chicken stock', NOW(), NOW()),
  ('ing_red_kidney_beans', 'red kidney beans, drained and rinsed', NOW(), NOW()),
  ('ing_black_beans', 'black beans, drained and rinsed', NOW(), NOW()),
  ('ing_bay_leaf', 'bay leaf', NOW(), NOW()),
  ('ing_lime_juice_garnish', 'Lime juice for garnish', NOW(), NOW())
ON CONFLICT ("name") DO UPDATE SET "updatedAt" = EXCLUDED."updatedAt";

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_beef_chili', 'Beef Chili', 'Meat', 15, 60, 75, 6, NULL, true, NOW(), NOW())
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
  ('ri_beef_chili_oil', 'recipe_beef_chili', 'ing_oil_to_coat_pot', NULL, 0, NULL, NOW(), NOW()),
  ('ri_beef_chili_ground_beef', 'recipe_beef_chili', 'ing_ground_beef', 'meas_pounds', 2, NULL, NOW(), NOW()),
  ('ri_beef_chili_onion', 'recipe_beef_chili', 'ing_onion_diced', 'meas_medium', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_jalapeno', 'recipe_beef_chili', 'ing_jalapeno_diced', NULL, 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_garlic', 'recipe_beef_chili', 'ing_garlic_minced', 'meas_cloves', 4, NULL, NOW(), NOW()),
  ('ri_beef_chili_tomato_paste', 'recipe_beef_chili', 'ing_tomato_paste', 'meas_tbsp', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_chili_powder', 'recipe_beef_chili', 'ing_chili_powder', 'meas_tbsp', 1.5, NULL, NOW(), NOW()),
  ('ri_beef_chili_cumin', 'recipe_beef_chili', 'ing_cumin', 'meas_tsp', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_garlic_powder', 'recipe_beef_chili', 'ing_garlic_powder', 'meas_tsp', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_salt_pepper', 'recipe_beef_chili', 'ing_salt_and_pepper', NULL, 0, NULL, NOW(), NOW()),
  ('ri_beef_chili_tomatoes', 'recipe_beef_chili', 'ing_diced_tomatoes', 'meas_10_oz_can', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_stock', 'recipe_beef_chili', 'ing_chicken_stock_range', NULL, 0, NULL, NOW(), NOW()),
  ('ri_beef_chili_kidney_beans', 'recipe_beef_chili', 'ing_red_kidney_beans', 'meas_15_oz_can', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_black_beans', 'recipe_beef_chili', 'ing_black_beans', 'meas_15_oz_can', 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_bay_leaf', 'recipe_beef_chili', 'ing_bay_leaf', NULL, 1, NULL, NOW(), NOW()),
  ('ri_beef_chili_lime', 'recipe_beef_chili', 'ing_lime_juice_garnish', NULL, 0, NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_beef_chili_1', 'recipe_beef_chili', 1, 'Heat a large heavy pot or Dutch oven over medium-high heat. Add enough oil to lightly coat the bottom of the pot.', NULL, NOW(), NOW()),
  ('step_beef_chili_2', 'recipe_beef_chili', 2, 'Add the ground beef and cook, breaking it up with a spoon, until browned. Drain excess fat if needed.', NULL, NOW(), NOW()),
  ('step_beef_chili_3', 'recipe_beef_chili', 3, 'Stir in the diced onion and jalapeño. Cook for 4-5 minutes, until softened. Add the minced garlic and cook for 30 seconds, until fragrant.', NULL, NOW(), NOW()),
  ('step_beef_chili_4', 'recipe_beef_chili', 4, 'Add the tomato paste, chili powder, cumin, garlic powder, salt, and pepper. Stir well and cook for 1-2 minutes to toast the spices and deepen the flavor.', NULL, NOW(), NOW()),
  ('step_beef_chili_5', 'recipe_beef_chili', 5, 'Add the diced tomatoes, 1 cup chicken stock, red kidney beans, black beans, and bay leaf. Stir to combine, scraping up any browned bits from the bottom of the pot.', NULL, NOW(), NOW()),
  ('step_beef_chili_6', 'recipe_beef_chili', 6, 'Bring to a simmer, then reduce the heat to low. Simmer uncovered for 45-60 minutes, stirring occasionally. Add more chicken stock as needed if the chili gets too thick.', NULL, NOW(), NOW()),
  ('step_beef_chili_7', 'recipe_beef_chili', 7, 'Remove the bay leaf. Taste and adjust salt and pepper. Serve hot with a squeeze of lime juice for garnish.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();
