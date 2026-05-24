-- Add next batch of recipes from iCloud Notes export. Each recipe includes a durable checked-in image.

-- Boba: Source image: Wikimedia Commons, 'Tapioca Pearl being cooked', CC BY-SA 4.0.
-- Ratatouille: Source image: Wikimedia Commons, 'Ratatouille-Dish' by Benoit5656, Public domain.
-- Lentil Soup: Source image: Wikimedia Commons, 'Homemade Lentil Soup - Lavash 2025-02-10' by Onthewings, CC0.
-- Split Pea Soup: Source image: Wikimedia Commons, 'Amy''s split pea soup' by Mx. Granger, CC0.
-- Vegetable Soup: Source image: Wikimedia Commons, 'Vegetable soup 6' by Gannu03, CC BY-SA 4.0.
-- Apple Crisp: Source image: Wikimedia Commons, 'Fresh baked apple crisp 01' by Infrogmation, CC BY-SA 4.0.
-- Banana Bread: Source image: Wikimedia Commons, 'Banana bread slices' by Shisma, CC BY 4.0.

INSERT INTO "Measurement" ("id", "name", "createdAt", "updatedAt") VALUES
  ('meas_bag', 'bag', NOW(), NOW()),
  ('meas_box', 'box', NOW(), NOW()),
  ('meas_can', 'can', NOW(), NOW()),
  ('meas_cloves', 'cloves', NOW(), NOW()),
  ('meas_cups', 'cups', NOW(), NOW()),
  ('meas_lemon', 'lemon', NOW(), NOW()),
  ('meas_oz', 'oz', NOW(), NOW()),
  ('meas_stick', 'stick', NOW(), NOW()),
  ('meas_tbsp', 'tbsp', NOW(), NOW()),
  ('meas_tsp', 'tsp', NOW(), NOW())
ON CONFLICT ("name") DO UPDATE SET "updatedAt" = EXCLUDED."updatedAt";

INSERT INTO "Ingredient" ("id", "name", "createdAt", "updatedAt") VALUES
  ('ing_granny_smith_apples', 'Granny Smith apples', NOW(), NOW()),
  ('ing_imagine_veggie_broth', 'Imagine veggie broth', NOW(), NOW()),
  ('ing_roma_tomatoes', 'Roma tomatoes', NOW(), NOW()),
  ('ing_baking_powder', 'baking powder', NOW(), NOW()),
  ('ing_baking_soda', 'baking soda', NOW(), NOW()),
  ('ing_bay_leaf', 'bay leaf', NOW(), NOW()),
  ('ing_bell_peppers__diced', 'bell peppers, diced', NOW(), NOW()),
  ('ing_black_food_coloring', 'black food coloring', NOW(), NOW()),
  ('ing_brown_sugar', 'brown sugar', NOW(), NOW()),
  ('ing_carrots', 'carrots', NOW(), NOW()),
  ('ing_celery_stalk', 'celery stalk', NOW(), NOW()),
  ('ing_chocolate_chips', 'chocolate chips', NOW(), NOW()),
  ('ing_chopped_basil', 'chopped basil', NOW(), NOW()),
  ('ing_chopped_parsley', 'chopped parsley', NOW(), NOW()),
  ('ing_cinnamon', 'cinnamon', NOW(), NOW()),
  ('ing_crushed_tomatoes', 'crushed tomatoes', NOW(), NOW()),
  ('ing_dried_thyme', 'dried thyme', NOW(), NOW()),
  ('ing_eggplant', 'eggplant', NOW(), NOW()),
  ('ing_eggs', 'eggs', NOW(), NOW()),
  ('ing_flour', 'flour', NOW(), NOW()),
  ('ing_fresh_chopped_basil', 'fresh chopped basil', NOW(), NOW()),
  ('ing_fresh_thyme', 'fresh thyme', NOW(), NOW()),
  ('ing_garlic', 'garlic', NOW(), NOW()),
  ('ing_garlic__minced', 'garlic, minced', NOW(), NOW()),
  ('ing_lemon_juice', 'lemon juice', NOW(), NOW()),
  ('ing_lentils', 'lentils', NOW(), NOW()),
  ('ing_light_brown_sugar', 'light brown sugar', NOW(), NOW()),
  ('ing_oats', 'oats', NOW(), NOW()),
  ('ing_oil', 'oil', NOW(), NOW()),
  ('ing_olive_oil', 'olive oil', NOW(), NOW()),
  ('ing_onion', 'onion', NOW(), NOW()),
  ('ing_onion__diced', 'onion, diced', NOW(), NOW()),
  ('ing_pecans__crushed', 'pecans, crushed', NOW(), NOW()),
  ('ing_potatoes', 'potatoes', NOW(), NOW()),
  ('ing_salt', 'salt', NOW(), NOW()),
  ('ing_salt_and_pepper', 'salt and pepper', NOW(), NOW()),
  ('ing_sea_salt', 'sea salt', NOW(), NOW()),
  ('ing_spinach', 'spinach', NOW(), NOW()),
  ('ing_split_peas', 'split peas', NOW(), NOW()),
  ('ing_sugar', 'sugar', NOW(), NOW()),
  ('ing_tapioca_starch', 'tapioca starch', NOW(), NOW()),
  ('ing_thyme', 'thyme', NOW(), NOW()),
  ('ing_toasted_walnuts', 'toasted walnuts', NOW(), NOW()),
  ('ing_tomato_paste', 'tomato paste', NOW(), NOW()),
  ('ing_unsalted_butter', 'unsalted butter', NOW(), NOW()),
  ('ing_vanilla_extract', 'vanilla extract', NOW(), NOW()),
  ('ing_veggie_broth', 'veggie broth', NOW(), NOW()),
  ('ing_very_ripe_bananas', 'very ripe bananas', NOW(), NOW()),
  ('ing_water', 'water', NOW(), NOW()),
  ('ing_yellow_squash', 'yellow squash', NOW(), NOW()),
  ('ing_zucchini', 'zucchini', NOW(), NOW())
ON CONFLICT ("name") DO UPDATE SET "updatedAt" = EXCLUDED."updatedAt";

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_boba', 'Boba', 'Desserts', 20, 25, 45, 6, '/recipe-images/boba.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_boba_1', 'recipe_boba', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.33333333, 'Boba pearls', NOW(), NOW()),
  ('ri_boba_2', 'recipe_boba', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.33333333, 'Boba pearls', NOW(), NOW()),
  ('ri_boba_3', 'recipe_boba', (SELECT "id" FROM "Ingredient" WHERE "name" = 'black food coloring'), NULL, 0, 'Boba pearls', NOW(), NOW()),
  ('ri_boba_4', 'recipe_boba', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tapioca starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, 'Boba pearls', NOW(), NOW()),
  ('ri_boba_5', 'recipe_boba', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 7, 'Syrup', NOW(), NOW()),
  ('ri_boba_6', 'recipe_boba', (SELECT "id" FROM "Ingredient" WHERE "name" = 'light brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.25, 'Syrup', NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_boba_1', 'recipe_boba', 1, 'Make the pearls: bring 1/3 cup water and 1/3 cup brown sugar to a simmer, stirring until dissolved. Add black food coloring if using.', NULL, NOW(), NOW()),
  ('step_boba_2', 'recipe_boba', 2, 'Stir in about half the tapioca starch while the syrup is hot, then add the remaining starch and knead carefully until a smooth dough forms.', NULL, NOW(), NOW()),
  ('step_boba_3', 'recipe_boba', 3, 'Roll the dough into small pearls, dusting with extra tapioca starch if sticky.', NULL, NOW(), NOW()),
  ('step_boba_4', 'recipe_boba', 4, 'Boil the pearls until chewy and cooked through, then drain.', NULL, NOW(), NOW()),
  ('step_boba_5', 'recipe_boba', 5, 'Make the syrup by simmering 7 tbsp water with 1 1/4 cups light brown sugar until glossy. Toss the cooked pearls in the syrup before serving.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_ratatouille', 'Ratatouille', 'Sides', 25, 80, 105, 8, '/recipe-images/ratatouille.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_ratatouille_1', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggplant'), NULL, 2, 'Veggies', NOW(), NOW()),
  ('ri_ratatouille_2', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'zucchini'), NULL, 2, 'Veggies', NOW(), NOW()),
  ('ri_ratatouille_3', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'yellow squash'), NULL, 2, 'Veggies', NOW(), NOW()),
  ('ri_ratatouille_4', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Roma tomatoes'), NULL, 6, 'Veggies', NOW(), NOW()),
  ('ri_ratatouille_5', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_6', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 4, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_7', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'bell peppers, diced'), NULL, 2, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_8', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'onion, diced'), NULL, 1, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_9', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'crushed tomatoes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'oz'), 28, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_10', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt and pepper'), NULL, 0, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_11', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'fresh chopped basil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, 'Sauce', NOW(), NOW()),
  ('ri_ratatouille_12', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chopped basil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, 'Topping', NOW(), NOW()),
  ('ri_ratatouille_13', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, 'Topping', NOW(), NOW()),
  ('ri_ratatouille_14', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chopped parsley'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, 'Topping', NOW(), NOW()),
  ('ri_ratatouille_15', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'fresh thyme'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 2, 'Topping', NOW(), NOW()),
  ('ri_ratatouille_16', 'recipe_ratatouille', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 4, 'Topping', NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_ratatouille_1', 'recipe_ratatouille', 1, 'Preheat the oven to 375°F. Slice the eggplant, zucchini, yellow squash, and Roma tomatoes into thin even rounds.', NULL, NOW(), NOW()),
  ('step_ratatouille_2', 'recipe_ratatouille', 2, 'Make the sauce: heat 2 tbsp olive oil in a pan, then sauté the garlic, bell peppers, and onion until softened. Add crushed tomatoes, salt, pepper, and chopped basil; simmer briefly.', NULL, NOW(), NOW()),
  ('step_ratatouille_3', 'recipe_ratatouille', 3, 'Spread the sauce in a baking dish and arrange the sliced vegetables over the top in overlapping rows or spirals.', NULL, NOW(), NOW()),
  ('step_ratatouille_4', 'recipe_ratatouille', 4, 'Mix the topping ingredients and spoon or brush over the vegetables.', NULL, NOW(), NOW()),
  ('step_ratatouille_5', 'recipe_ratatouille', 5, 'Cover and bake for about 40 minutes, then uncover and bake another 20 minutes, until the vegetables are tender and lightly browned.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_lentil_soup', 'Lentil Soup', 'Soups', 15, 60, 75, 8, '/recipe-images/lentil-soup.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_lentil_soup_1', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'onion'), NULL, 1, NULL, NOW(), NOW()),
  ('ri_lentil_soup_2', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, NULL, NOW(), NOW()),
  ('ri_lentil_soup_3', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 3, NULL, NOW(), NOW()),
  ('ri_lentil_soup_4', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'carrots'), NULL, 3, NULL, NOW(), NOW()),
  ('ri_lentil_soup_5', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'celery stalk'), NULL, 1, NULL, NOW(), NOW()),
  ('ri_lentil_soup_6', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tomato paste'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, NULL, NOW(), NOW()),
  ('ri_lentil_soup_7', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 10, NULL, NOW(), NOW()),
  ('ri_lentil_soup_8', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lentils'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.5, NULL, NOW(), NOW()),
  ('ri_lentil_soup_9', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'dried thyme'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, NULL, NOW(), NOW()),
  ('ri_lentil_soup_10', 'recipe_lentil_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), NULL, 0, NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_lentil_soup_1', 'recipe_lentil_soup', 1, 'Dice the onion, carrots, and celery, and mince the garlic.', NULL, NOW(), NOW()),
  ('step_lentil_soup_2', 'recipe_lentil_soup', 2, 'Heat olive oil in a soup pot. Sauté the onion, carrots, and celery until beginning to soften.', NULL, NOW(), NOW()),
  ('step_lentil_soup_3', 'recipe_lentil_soup', 3, 'Add garlic and tomato paste and cook for 1-2 minutes.', NULL, NOW(), NOW()),
  ('step_lentil_soup_4', 'recipe_lentil_soup', 4, 'Add the water, lentils, thyme, and salt. Bring to a boil.', NULL, NOW(), NOW()),
  ('step_lentil_soup_5', 'recipe_lentil_soup', 5, 'Reduce to a simmer and cook until the lentils are tender, about 45-60 minutes. Adjust salt before serving.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_split_pea_soup', 'Split Pea Soup', 'Soups', 15, 90, 105, 8, '/recipe-images/split-pea-soup.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_split_pea_soup_1', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'onion'), NULL, 1, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_2', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_3', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'potatoes'), NULL, 2, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_4', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'carrots'), NULL, 5, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_5', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'veggie broth'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_6', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 6, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_7', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'split peas'), (SELECT "id" FROM "Measurement" WHERE "name" = 'bag'), 1, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_8', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'bay leaf'), NULL, 1, NULL, NOW(), NOW()),
  ('ri_split_pea_soup_9', 'recipe_split_pea_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt and pepper'), NULL, 0, NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_split_pea_soup_1', 'recipe_split_pea_soup', 1, 'Dice the onion, potatoes, and carrots.', NULL, NOW(), NOW()),
  ('step_split_pea_soup_2', 'recipe_split_pea_soup', 2, 'Heat olive oil in a soup pot and sauté the onion until softened.', NULL, NOW(), NOW()),
  ('step_split_pea_soup_3', 'recipe_split_pea_soup', 3, 'Add potatoes, carrots, veggie broth, water, split peas, bay leaf, salt, and pepper.', NULL, NOW(), NOW()),
  ('step_split_pea_soup_4', 'recipe_split_pea_soup', 4, 'Bring to a boil, then reduce to a simmer. Cook for 1-1.5 hours, stirring occasionally, until the peas break down and the soup thickens.', NULL, NOW(), NOW()),
  ('step_split_pea_soup_5', 'recipe_split_pea_soup', 5, 'Remove the bay leaf and adjust seasoning before serving.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_vegetable_soup', 'Vegetable Soup', 'Soups', 15, 55, 70, 8, '/recipe-images/vegetable-soup.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_vegetable_soup_1', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_2', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'onion'), NULL, 1, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_3', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 4, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_4', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tomato paste'), (SELECT "id" FROM "Measurement" WHERE "name" = 'can'), 0.5, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_5', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'carrots'), NULL, 3, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_6', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'zucchini'), NULL, 1, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_7', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 5, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_8', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Imagine veggie broth'), (SELECT "id" FROM "Measurement" WHERE "name" = 'box'), 1, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_9', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lentils'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.25, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_10', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), NULL, 0, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_11', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'thyme'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_12', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lemon juice'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lemon'), 0.5, NULL, NOW(), NOW()),
  ('ri_vegetable_soup_13', 'recipe_vegetable_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'spinach'), (SELECT "id" FROM "Measurement" WHERE "name" = 'oz'), 4, NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_vegetable_soup_1', 'recipe_vegetable_soup', 1, 'Dice the onion, carrots, and zucchini, and mince the garlic.', NULL, NOW(), NOW()),
  ('step_vegetable_soup_2', 'recipe_vegetable_soup', 2, 'Heat olive oil in a soup pot. Sauté onion until softened, then add garlic and tomato paste and cook briefly.', NULL, NOW(), NOW()),
  ('step_vegetable_soup_3', 'recipe_vegetable_soup', 3, 'Add carrots, zucchini, water, veggie broth, lentils, salt, and thyme. Bring to a boil.', NULL, NOW(), NOW()),
  ('step_vegetable_soup_4', 'recipe_vegetable_soup', 4, 'Reduce to a simmer and cook until the lentils and vegetables are tender, about 45-55 minutes.', NULL, NOW(), NOW()),
  ('step_vegetable_soup_5', 'recipe_vegetable_soup', 5, 'Stir in lemon juice and spinach at the end, cooking just until the spinach wilts.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_apple_crisp', 'Apple Crisp', 'Desserts', 20, 55, 75, 8, '/recipe-images/apple-crisp.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_apple_crisp_1', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Granny Smith apples'), NULL, 6, 'Base', NOW(), NOW()),
  ('ri_apple_crisp_2', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'light brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.66666667, 'Base', NOW(), NOW()),
  ('ri_apple_crisp_3', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cinnamon'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, 'Base', NOW(), NOW()),
  ('ri_apple_crisp_4', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, 'Base', NOW(), NOW()),
  ('ri_apple_crisp_5', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.75, 'Topping', NOW(), NOW()),
  ('ri_apple_crisp_6', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oats'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.75, 'Topping', NOW(), NOW()),
  ('ri_apple_crisp_7', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, 'Topping', NOW(), NOW()),
  ('ri_apple_crisp_8', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.33333333, 'Topping', NOW(), NOW()),
  ('ri_apple_crisp_9', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'pecans, crushed'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, 'Topping', NOW(), NOW()),
  ('ri_apple_crisp_10', 'recipe_apple_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cinnamon'), NULL, 0, 'Topping', NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_apple_crisp_1', 'recipe_apple_crisp', 1, 'Preheat the oven to 350°F. Peel and slice the apples.', NULL, NOW(), NOW()),
  ('step_apple_crisp_2', 'recipe_apple_crisp', 2, 'Toss the apples with light brown sugar, cinnamon, and vanilla, then spread in a baking dish.', NULL, NOW(), NOW()),
  ('step_apple_crisp_3', 'recipe_apple_crisp', 3, 'Mix the flour, oats, brown sugar, oil, pecans, and a dash of cinnamon until crumbly.', NULL, NOW(), NOW()),
  ('step_apple_crisp_4', 'recipe_apple_crisp', 4, 'Sprinkle the topping evenly over the apples.', NULL, NOW(), NOW()),
  ('step_apple_crisp_5', 'recipe_apple_crisp', 5, 'Bake for 50-60 minutes, until the apples are bubbling and the topping is golden.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();

INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_banana_bread', 'Banana Bread', 'Desserts', 15, 60, 75, 10, '/recipe-images/banana-bread.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "name" = EXCLUDED."name",
  "category" = EXCLUDED."category",
  "prepTime" = EXCLUDED."prepTime",
  "cookTime" = EXCLUDED."cookTime",
  "totalTime" = EXCLUDED."totalTime",
  "serves" = EXCLUDED."serves",
  "imageUrl" = EXCLUDED."imageUrl",
  "published" = EXCLUDED."published",
  "updatedAt" = NOW();

INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "section", "createdAt", "updatedAt") VALUES
  ('ri_banana_bread_1', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.75, NULL, NOW(), NOW()),
  ('ri_banana_bread_2', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, NULL, NOW(), NOW()),
  ('ri_banana_bread_3', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking soda'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, NULL, NOW(), NOW()),
  ('ri_banana_bread_4', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sea salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, NULL, NOW(), NOW()),
  ('ri_banana_bread_5', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'unsalted butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'stick'), 1, NULL, NOW(), NOW()),
  ('ri_banana_bread_6', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, NULL, NOW(), NOW()),
  ('ri_banana_bread_7', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, NULL, NOW(), NOW()),
  ('ri_banana_bread_8', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 2, NULL, NOW(), NOW()),
  ('ri_banana_bread_9', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, NULL, NOW(), NOW()),
  ('ri_banana_bread_10', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'very ripe bananas'), NULL, 3, NULL, NOW(), NOW()),
  ('ri_banana_bread_11', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chocolate chips'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, NULL, NOW(), NOW()),
  ('ri_banana_bread_12', 'recipe_banana_bread', (SELECT "id" FROM "Ingredient" WHERE "name" = 'toasted walnuts'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "ingredientId" = EXCLUDED."ingredientId",
  "measurementId" = EXCLUDED."measurementId",
  "amount" = EXCLUDED."amount",
  "section" = EXCLUDED."section",
  "updatedAt" = NOW();

INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_banana_bread_1', 'recipe_banana_bread', 1, 'Preheat the oven to 350°F and grease a loaf pan.', NULL, NOW(), NOW()),
  ('step_banana_bread_2', 'recipe_banana_bread', 2, 'Whisk together the flour, baking powder, baking soda, and sea salt.', NULL, NOW(), NOW()),
  ('step_banana_bread_3', 'recipe_banana_bread', 3, 'Cream the butter with the brown sugar and sugar, then mix in the eggs and vanilla.', NULL, NOW(), NOW()),
  ('step_banana_bread_4', 'recipe_banana_bread', 4, 'Mash the bananas and mix them into the batter. Fold in the dry ingredients, then fold in chocolate chips and toasted walnuts.', NULL, NOW(), NOW()),
  ('step_banana_bread_5', 'recipe_banana_bread', 5, 'Pour into the loaf pan and bake until a tester comes out clean, about 55-65 minutes. Cool before slicing.', NULL, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET
  "stepNumber" = EXCLUDED."stepNumber",
  "text" = EXCLUDED."text",
  "imageUrl" = EXCLUDED."imageUrl",
  "updatedAt" = NOW();
