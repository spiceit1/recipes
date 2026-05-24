-- Adds remaining complete recipes from Douglas iCloud Notes export. Images are locally generated recipe-card illustrations.
BEGIN;

INSERT INTO "Measurement" ("id", "name", "createdAt", "updatedAt") VALUES
  ('meas_bag', 'bag', NOW(), NOW()),
  ('meas_can', 'can', NOW(), NOW()),
  ('meas_cloves', 'cloves', NOW(), NOW()),
  ('meas_cube', 'cube', NOW(), NOW()),
  ('meas_cups', 'cups', NOW(), NOW()),
  ('meas_dash', 'dash', NOW(), NOW()),
  ('meas_eggs', 'eggs', NOW(), NOW()),
  ('meas_fillets', 'fillets', NOW(), NOW()),
  ('meas_large', 'large', NOW(), NOW()),
  ('meas_lb', 'lb', NOW(), NOW()),
  ('meas_medium', 'medium', NOW(), NOW()),
  ('meas_oz', 'oz', NOW(), NOW()),
  ('meas_packages', 'packages', NOW(), NOW()),
  ('meas_packets', 'packets', NOW(), NOW()),
  ('meas_pinch', 'pinch', NOW(), NOW()),
  ('meas_slices', 'slices', NOW(), NOW()),
  ('meas_small', 'small', NOW(), NOW()),
  ('meas_sprigs', 'sprigs', NOW(), NOW()),
  ('meas_stalks', 'stalks', NOW(), NOW()),
  ('meas_stick', 'stick', NOW(), NOW()),
  ('meas_tbsp', 'tbsp', NOW(), NOW()),
  ('meas_tsp', 'tsp', NOW(), NOW())
ON CONFLICT ("name") DO NOTHING;

INSERT INTO "Ingredient" ("id", "name", "createdAt", "updatedAt") VALUES
  ('ing_300g_whole_spelt_flour_a8599a19', '300g whole spelt flour', NOW(), NOW()),
  ('ing_360g_white_spelt_flour_7b69aa58', '360g white spelt flour', NOW(), NOW()),
  ('ing_60g_sugar_150177c3', '60g sugar', NOW(), NOW()),
  ('ing_american_cheese_dce4130e', 'American cheese', NOW(), NOW()),
  ('ing_blue_food_coloring_fde0fca5', 'Blue food coloring', NOW(), NOW()),
  ('ing_bunch_of_fresh_basil_fb2901f7', 'Bunch of fresh basil', NOW(), NOW()),
  ('ing_chocolate_chunks_28b4c906', 'Chocolate chunks', NOW(), NOW()),
  ('ing_cold_water_to_emulsify_99b4ac0a', 'Cold water to emulsify', NOW(), NOW()),
  ('ing_couple_sprigs_thyme_250b0ba0', 'Couple sprigs thyme', NOW(), NOW()),
  ('ing_cracked_black_pepper_f9b290c9', 'Cracked black pepper', NOW(), NOW()),
  ('ing_dash_of_cinnamon_03a24023', 'Dash of cinnamon', NOW(), NOW()),
  ('ing_egg_wash_d0fa25df', 'Egg wash', NOW(), NOW()),
  ('ing_frank_hot_sauce_9cb6a6d7', 'Frank hot sauce', NOW(), NOW()),
  ('ing_fresh_basil_for_topping_e8f3c0fe', 'Fresh basil for topping', NOW(), NOW()),
  ('ing_freshly_grated_parmesan_394c8774', 'Freshly grated Parmesan', NOW(), NOW()),
  ('ing_garlic_confit_4decbe23', 'Garlic confit', NOW(), NOW()),
  ('ing_juice_of_1_2_lemon_624a8179', 'Juice of 1/2 lemon', NOW(), NOW()),
  ('ing_juice_of_one_lime_400359d1', 'Juice of one lime', NOW(), NOW()),
  ('ing_lior_wheat_berries_1781fe6c', 'Lior wheat berries', NOW(), NOW()),
  ('ing_little_garlic_powder_082c98ec', 'Little garlic powder', NOW(), NOW()),
  ('ing_msg_6460830f', 'MSG', NOW(), NOW()),
  ('ing_marinara_sauce_0476c28d', 'Marinara sauce', NOW(), NOW()),
  ('ing_marrow_bones_optional_ec2ef944', 'Marrow bones, optional', NOW(), NOW()),
  ('ing_mozzarella_muenster_cheddar_bc822af0', 'Mozzarella/Muenster/Cheddar', NOW(), NOW()),
  ('ing_optional_red_food_coloring_255b18d2', 'Optional red food coloring', NOW(), NOW()),
  ('ing_parmesan_09216e29', 'Parmesan', NOW(), NOW()),
  ('ing_pinch_of_red_pepper_flakes_bd67071a', 'Pinch of red pepper flakes', NOW(), NOW()),
  ('ing_pinch_of_salt_fd37d69c', 'Pinch of salt', NOW(), NOW()),
  ('ing_red_wine_to_deglaze_f23c6cb3', 'Red wine to deglaze', NOW(), NOW()),
  ('ing_salt_49f8edc3', 'Salt', NOW(), NOW()),
  ('ing_salt_and_pepper_89fff648', 'Salt and pepper', NOW(), NOW()),
  ('ing_salt_and_pepper_to_taste_f9164064', 'Salt and pepper to taste', NOW(), NOW()),
  ('ing_salt_to_taste_8070db40', 'Salt to taste', NOW(), NOW()),
  ('ing_sprinkle_allspice_318c7dbf', 'Sprinkle allspice', NOW(), NOW()),
  ('ing_sprinkle_cayenne_pepper_f4365230', 'Sprinkle cayenne pepper', NOW(), NOW()),
  ('ing_sprinkle_cinnamon_6b13168f', 'Sprinkle cinnamon', NOW(), NOW()),
  ('ing_sprinkle_paprika_5cc73d8e', 'Sprinkle paprika', NOW(), NOW()),
  ('ing_telma_beef_bouillon_optional_0724250c', 'Telma beef bouillon, optional', NOW(), NOW()),
  ('ing_up_to_1_2_cup_additional_water_afbd3931', 'Up to 1/2 cup additional water', NOW(), NOW()),
  ('ing_vidalia_onions_25c829e2', 'Vidalia onions', NOW(), NOW()),
  ('ing_water_or_stock_to_cover_60f93eb8', 'Water or stock to cover', NOW(), NOW()),
  ('ing_worcestershire_9671d59c', 'Worcestershire', NOW(), NOW()),
  ('ing_yukon_gold_potatoes_c9397d17', 'Yukon gold potatoes', NOW(), NOW()),
  ('ing_all_purpose_flour_e392e1d4', 'all purpose flour', NOW(), NOW()),
  ('ing_all_purpose_flour_e832b6a0', 'all-purpose flour', NOW(), NOW()),
  ('ing_almond_milk_a188829d', 'almond milk', NOW(), NOW()),
  ('ing_apple_cider_vinegar_a761e0cc', 'apple cider vinegar', NOW(), NOW()),
  ('ing_avocado_oil_1eb9bea1', 'avocado oil', NOW(), NOW()),
  ('ing_bag_flour_sifted_7caab52e', 'bag flour, sifted', NOW(), NOW()),
  ('ing_baking_powder_347115f5', 'baking powder', NOW(), NOW()),
  ('ing_baking_soda_24244443', 'baking soda', NOW(), NOW()),
  ('ing_bay_leaf_3a5d1bb3', 'bay leaf', NOW(), NOW()),
  ('ing_beef_chicken_bones_66794447', 'beef/chicken bones', NOW(), NOW()),
  ('ing_bell_peppers_4ab3face', 'bell peppers', NOW(), NOW()),
  ('ing_black_pepper_b32ce3ce', 'black pepper', NOW(), NOW()),
  ('ing_blueberries_b2aa8890', 'blueberries', NOW(), NOW()),
  ('ing_brown_sugar_0cae7780', 'brown sugar', NOW(), NOW()),
  ('ing_butter_d99a16eb', 'butter', NOW(), NOW()),
  ('ing_celery_641e83ce', 'celery', NOW(), NOW()),
  ('ing_chicken_cef7e592', 'chicken', NOW(), NOW()),
  ('ing_chicken_breast_b01fd0fe', 'chicken breast', NOW(), NOW()),
  ('ing_chicken_stock_fab36638', 'chicken stock', NOW(), NOW()),
  ('ing_chicken_cubed_c13b89c1', 'chicken, cubed', NOW(), NOW()),
  ('ing_chili_flakes_b6aa490c', 'chili flakes', NOW(), NOW()),
  ('ing_coconut_oil_617d9a5b', 'coconut oil', NOW(), NOW()),
  ('ing_cookie_butter_cddb5869', 'cookie butter', NOW(), NOW()),
  ('ing_corn_starch_e125746d', 'corn starch', NOW(), NOW()),
  ('ing_cornflake_crumbs_de10b72a', 'cornflake crumbs', NOW(), NOW()),
  ('ing_cornflakes_27833489', 'cornflakes', NOW(), NOW()),
  ('ing_cottage_cheese_ba6ed0c5', 'cottage cheese', NOW(), NOW()),
  ('ing_cream_of_tartar_a7d1383a', 'cream of tartar', NOW(), NOW()),
  ('ing_crushed_red_pepper_flakes_02d904cb', 'crushed red pepper flakes', NOW(), NOW()),
  ('ing_crushed_tomatoes_bbedc760', 'crushed tomatoes', NOW(), NOW()),
  ('ing_cumin_14ae5485', 'cumin', NOW(), NOW()),
  ('ing_dill_relish_98fb652a', 'dill relish', NOW(), NOW()),
  ('ing_dried_rosemary_fc370857', 'dried rosemary', NOW(), NOW()),
  ('ing_dried_thyme_9c614d20', 'dried thyme', NOW(), NOW()),
  ('ing_egg_4fa6024f', 'egg', NOW(), NOW()),
  ('ing_eggs_bd111dcb', 'eggs', NOW(), NOW()),
  ('ing_fire_roasted_tomatoes_325e5694', 'fire roasted tomatoes', NOW(), NOW()),
  ('ing_flank_steak_b7d1fc6d', 'flank steak', NOW(), NOW()),
  ('ing_flour_3bcfa747', 'flour', NOW(), NOW()),
  ('ing_fresh_garlic_7d5962a6', 'fresh garlic', NOW(), NOW()),
  ('ing_freshly_grated_garlic_f37e2824', 'freshly grated garlic', NOW(), NOW()),
  ('ing_freshly_grated_ginger_619aab71', 'freshly grated ginger', NOW(), NOW()),
  ('ing_garlic_2ade5d5a', 'garlic', NOW(), NOW()),
  ('ing_garlic_clove_pressed_56b9c22e', 'garlic clove, pressed', NOW(), NOW()),
  ('ing_garlic_cloves_grated_790cf905', 'garlic cloves, grated', NOW(), NOW()),
  ('ing_garlic_powder_5a8e67c4', 'garlic powder', NOW(), NOW()),
  ('ing_garlic_minced_a9a07ad7', 'garlic, minced', NOW(), NOW()),
  ('ing_garlic_pressed_70ffc72c', 'garlic, pressed', NOW(), NOW()),
  ('ing_ginger_grated_ff1e346c', 'ginger, grated', NOW(), NOW()),
  ('ing_ginger_minced_0633221b', 'ginger, minced', NOW(), NOW()),
  ('ing_grainy_mustard_2822711f', 'grainy mustard', NOW(), NOW()),
  ('ing_ground_beef_b0578397', 'ground beef', NOW(), NOW()),
  ('ing_ground_chicken_29ff6ad0', 'ground chicken', NOW(), NOW()),
  ('ing_heavy_cream_75fcd79d', 'heavy cream', NOW(), NOW()),
  ('ing_honey_9d75342c', 'honey', NOW(), NOW()),
  ('ing_hot_paprika_7c72427b', 'hot paprika', NOW(), NOW()),
  ('ing_hot_water_2b8f007c', 'hot water', NOW(), NOW()),
  ('ing_instant_rise_yeast_a5e8831a', 'instant rise yeast', NOW(), NOW()),
  ('ing_ketchup_1c5f737b', 'ketchup', NOW(), NOW()),
  ('ing_kosher_salt_56f0c23c', 'kosher salt', NOW(), NOW()),
  ('ing_large_egg_8293f63e', 'large egg', NOW(), NOW()),
  ('ing_large_egg_yolk_81a13433', 'large egg yolk', NOW(), NOW()),
  ('ing_large_yellow_onion_915add9d', 'large yellow onion', NOW(), NOW()),
  ('ing_lemon_juice_b866f5ea', 'lemon juice', NOW(), NOW()),
  ('ing_light_corn_syrup_59db7920', 'light corn syrup', NOW(), NOW()),
  ('ing_lukewarm_water_994f7787', 'lukewarm water', NOW(), NOW()),
  ('ing_maple_syrup_2322c5d3', 'maple syrup', NOW(), NOW()),
  ('ing_mayonnaise_7c34d3ef', 'mayonnaise', NOW(), NOW()),
  ('ing_medium_carrots_3c9e38dc', 'medium carrots', NOW(), NOW()),
  ('ing_medium_onion_ef0af16d', 'medium onion', NOW(), NOW()),
  ('ing_medium_onion_diced_95e20cd8', 'medium onion, diced', NOW(), NOW()),
  ('ing_medium_onion_finely_diced_9d15aedd', 'medium onion, finely diced', NOW(), NOW()),
  ('ing_medium_onions_63259628', 'medium onions', NOW(), NOW()),
  ('ing_medium_yellow_onion_145b1459', 'medium yellow onion', NOW(), NOW()),
  ('ing_melted_butter_defb1084', 'melted butter', NOW(), NOW()),
  ('ing_milk_cf5dbf0e', 'milk', NOW(), NOW()),
  ('ing_minced_garlic_a968892b', 'minced garlic', NOW(), NOW()),
  ('ing_mini_chocolate_chips_ae7988d9', 'mini chocolate chips', NOW(), NOW()),
  ('ing_mozzarella_muenster_84703837', 'mozzarella/Muenster', NOW(), NOW()),
  ('ing_mozzarella_muenster_cheese_0770038b', 'mozzarella/Muenster cheese', NOW(), NOW()),
  ('ing_neutral_oil_49c45f58', 'neutral oil', NOW(), NOW()),
  ('ing_non_dairy_milk_bcce75b9', 'non-dairy milk', NOW(), NOW()),
  ('ing_oats_4b6cc5f2', 'oats', NOW(), NOW()),
  ('ing_oil_a5f58c39', 'oil', NOW(), NOW()),
  ('ing_oil_plus_one_squirt_c69bd8fc', 'oil plus one squirt', NOW(), NOW()),
  ('ing_olive_oil_6aa3c457', 'olive oil', NOW(), NOW()),
  ('ing_onion_powder_2255262f', 'onion powder', NOW(), NOW()),
  ('ing_oot_22842dbe', 'oot', NOW(), NOW()),
  ('ing_orange_juice_3b2edbd1', 'orange juice', NOW(), NOW()),
  ('ing_oregano_2baab48a', 'oregano', NOW(), NOW()),
  ('ing_paprika_60163696', 'paprika', NOW(), NOW()),
  ('ing_paprika_in_oil_538f9e4e', 'paprika in oil', NOW(), NOW()),
  ('ing_pasta_46139b0b', 'pasta', NOW(), NOW()),
  ('ing_pecans_crushed_f27e40ce', 'pecans, crushed', NOW(), NOW()),
  ('ing_pepper_64356bcf', 'pepper', NOW(), NOW()),
  ('ing_plain_non_dairy_yogurt_df24d2e2', 'plain non-dairy yogurt', NOW(), NOW()),
  ('ing_potatoes_8819d190', 'potatoes', NOW(), NOW()),
  ('ing_powdered_sugar_444ef577', 'powdered sugar', NOW(), NOW()),
  ('ing_red_pepper_flakes_9d988c50', 'red pepper flakes', NOW(), NOW()),
  ('ing_rice_vinegar_f5efba87', 'rice vinegar', NOW(), NOW()),
  ('ing_ricotta_2e5bfcd4', 'ricotta', NOW(), NOW()),
  ('ing_ripe_bananas_mashed_5780a0c7', 'ripe bananas, mashed', NOW(), NOW()),
  ('ing_ripe_tomatoes_260ead8b', 'ripe tomatoes', NOW(), NOW()),
  ('ing_rose_water_668ad4fe', 'rose water', NOW(), NOW()),
  ('ing_salt_b295d117', 'salt', NOW(), NOW()),
  ('ing_salted_butter_427e3ae0', 'salted butter', NOW(), NOW()),
  ('ing_sea_salt_98078ad7', 'sea salt', NOW(), NOW()),
  ('ing_sesame_oil_6928e7b9', 'sesame oil', NOW(), NOW()),
  ('ing_short_rib_or_beef_cheek_2c019cd1', 'short rib or beef cheek', NOW(), NOW()),
  ('ing_shredded_mozzarella_c12c6883', 'shredded mozzarella', NOW(), NOW()),
  ('ing_small_onion_ground_352d35ea', 'small onion, ground', NOW(), NOW()),
  ('ing_soft_peaches_e9575086', 'soft peaches', NOW(), NOW()),
  ('ing_soy_sauce_731669ee', 'soy sauce', NOW(), NOW()),
  ('ing_sparkling_water_b6449471', 'sparkling water', NOW(), NOW()),
  ('ing_spinach_4e766d85', 'spinach', NOW(), NOW()),
  ('ing_sriracha_218f2cb5', 'sriracha', NOW(), NOW()),
  ('ing_sugar_30eef85d', 'sugar', NOW(), NOW()),
  ('ing_sweet_paprika_9867ab75', 'sweet paprika', NOW(), NOW()),
  ('ing_taco_sauce_d444b4f9', 'taco sauce', NOW(), NOW()),
  ('ing_taco_seasoning_02abbe48', 'taco seasoning', NOW(), NOW()),
  ('ing_tahini_210987ca', 'tahini', NOW(), NOW()),
  ('ing_thyme_23162a17', 'thyme', NOW(), NOW()),
  ('ing_toasted_sesame_oil_268d035f', 'toasted sesame oil', NOW(), NOW()),
  ('ing_tomato_paste_b80c463e', 'tomato paste', NOW(), NOW()),
  ('ing_unsalted_browned_butter_8fbac06e', 'unsalted browned butter', NOW(), NOW()),
  ('ing_unsalted_salted_butter_964625eb', 'unsalted/salted butter', NOW(), NOW()),
  ('ing_vanilla_extract_75449ff5', 'vanilla extract', NOW(), NOW()),
  ('ing_veggie_broth_35f9d59a', 'veggie broth', NOW(), NOW()),
  ('ing_vodka_c99eb391', 'vodka', NOW(), NOW()),
  ('ing_warm_water_d8ccc706', 'warm water', NOW(), NOW()),
  ('ing_water_6d5a4592', 'water', NOW(), NOW()),
  ('ing_white_pepper_083a1785', 'white pepper', NOW(), NOW()),
  ('ing_white_spelt_flour_777a4a5c', 'white spelt flour', NOW(), NOW()),
  ('ing_white_sugar_4ea410fe', 'white sugar', NOW(), NOW()),
  ('ing_white_vinegar_31d39787', 'white vinegar', NOW(), NOW()),
  ('ing_whole_milk_6fad3bac', 'whole milk', NOW(), NOW()),
  ('ing_whole_peppercorns_fadae365', 'whole peppercorns', NOW(), NOW()),
  ('ing_whole_tomatoes_crushed_cfcc400e', 'whole tomatoes, crushed', NOW(), NOW()),
  ('ing_yeast_8f736c8c', 'yeast', NOW(), NOW()),
  ('ing_yellow_mustard_65449e7f', 'yellow mustard', NOW(), NOW()),
  ('ing_ziti_pasta_83cde567', 'ziti pasta', NOW(), NOW()),
  ('ing_zucchini_squash_1c47fb04', 'zucchini squash', NOW(), NOW())
ON CONFLICT ("name") DO NOTHING;

-- Salmon Rub
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_salmon_rub', 'Salmon Rub', 'Parve', 5, 0, 5, 4, '/recipe-images/salmon-rub.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_salmon_rub';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_salmon_rub_1', 'recipe_salmon_rub', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_salmon_rub_2', 'recipe_salmon_rub', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_salmon_rub_3', 'recipe_salmon_rub', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sweet paprika'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_salmon_rub_4', 'recipe_salmon_rub', (SELECT "id" FROM "Ingredient" WHERE "name" = 'kosher salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_salmon_rub_5', 'recipe_salmon_rub', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Cracked black pepper'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_salmon_rub';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_salmon_rub_1', 'recipe_salmon_rub', 1, 'Mix the brown sugar, garlic powder, sweet paprika, kosher salt, and cracked black pepper together in a small bowl.', NULL, NOW(), NOW()),
  ('step_salmon_rub_2', 'recipe_salmon_rub', 2, 'Rub evenly over salmon before roasting, grilling, or broiling.', NULL, NOW(), NOW());

-- Brown Stock
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_brown_stock', 'Brown Stock', 'Meat', 20, 240, 260, 12, '/recipe-images/brown-stock.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_brown_stock';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_brown_stock_1', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'beef/chicken bones'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 3, '3-4', NULL, NOW(), NOW()),
  ('ri_brown_stock_2', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium onions'), NULL, 2, '2', NULL, NOW(), NOW()),
  ('ri_brown_stock_3', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium carrots'), NULL, 3, '3', NULL, NOW(), NOW()),
  ('ri_brown_stock_4', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'celery'), (SELECT "id" FROM "Measurement" WHERE "name" = 'stalks'), 2, '2', NULL, NOW(), NOW()),
  ('ri_brown_stock_5', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'thyme'), (SELECT "id" FROM "Measurement" WHERE "name" = 'sprigs'), 4, '4-5', NULL, NOW(), NOW()),
  ('ri_brown_stock_6', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'bay leaf'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_brown_stock_7', 'recipe_brown_stock', (SELECT "id" FROM "Ingredient" WHERE "name" = 'whole peppercorns'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_brown_stock';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_brown_stock_1', 'recipe_brown_stock', 1, 'Roast the bones until deeply browned.', NULL, NOW(), NOW()),
  ('step_brown_stock_2', 'recipe_brown_stock', 2, 'Add the onions, carrots, and celery and roast until browned.', NULL, NOW(), NOW()),
  ('step_brown_stock_3', 'recipe_brown_stock', 3, 'Transfer everything to a stockpot with thyme, bay leaf, and peppercorns. Cover with water.', NULL, NOW(), NOW()),
  ('step_brown_stock_4', 'recipe_brown_stock', 4, 'Simmer gently for several hours, skimming as needed, then strain.', NULL, NOW(), NOW());

-- Carne Desmechada
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_carne_desmechada', 'Carne Desmechada', 'Meat', 20, 180, 200, 6, '/recipe-images/carne-desmechada.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_carne_desmechada';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_carne_desmechada_1', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flank steak'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 2, '2', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_2', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'bell peppers'), NULL, 2, '2', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_3', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'large yellow onion'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_4', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 6, '6', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_5', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oregano'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_6', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_7', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cumin'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_8', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tomato paste'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_9', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'whole tomatoes, crushed'), (SELECT "id" FROM "Measurement" WHERE "name" = 'can'), 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_10', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chicken stock'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2-3', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_11', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Couple sprigs thyme'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_carne_desmechada_12', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'bay leaf'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_carne_desmechada_13', 'recipe_carne_desmechada', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_carne_desmechada';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_carne_desmechada_1', 'recipe_carne_desmechada', 1, 'Place the flank steak, peppers, onion, garlic, seasonings, tomato paste, crushed tomatoes, chicken stock, thyme, and bay leaf in a covered pot.', NULL, NOW(), NOW()),
  ('step_carne_desmechada_2', 'recipe_carne_desmechada', 2, 'Cook covered at 300°F for about 3 hours, until the beef is very tender.', NULL, NOW(), NOW()),
  ('step_carne_desmechada_3', 'recipe_carne_desmechada', 3, 'Remove the beef, shred it, and return it to the sauce. Adjust salt and pepper before serving.', NULL, NOW(), NOW());

-- Chicken Strips
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_chicken_strips', 'Chicken Strips', 'Meat', 25, 20, 45, 8, '/recipe-images/chicken-strips.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_chicken_strips';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_chicken_strips_1', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_chicken_strips_2', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_chicken_strips_3', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'black pepper'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_strips_4', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_chicken_strips_5', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_strips_6', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 3, '3', NULL, NOW(), NOW()),
  ('ri_chicken_strips_7', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_chicken_strips_8', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cornflake crumbs'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_strips_9', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cornflakes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_strips_10', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_strips_11', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'paprika'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_chicken_strips_12', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 4, '4', NULL, NOW(), NOW()),
  ('ri_chicken_strips_13', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white pepper'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_strips_14', 'recipe_chicken_strips', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_chicken_strips';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_chicken_strips_1', 'recipe_chicken_strips', 1, 'Whisk the batter ingredients together until smooth.', NULL, NOW(), NOW()),
  ('step_chicken_strips_2', 'recipe_chicken_strips', 2, 'Mix the cornflake crumb coating ingredients in a separate bowl.', NULL, NOW(), NOW()),
  ('step_chicken_strips_3', 'recipe_chicken_strips', 3, 'Dip chicken strips into batter, then press into the crumb mixture.', NULL, NOW(), NOW()),
  ('step_chicken_strips_4', 'recipe_chicken_strips', 4, 'Bake or fry until the chicken is cooked through and the coating is crisp.', NULL, NOW(), NOW());

-- Chicken Tacos
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_chicken_tacos', 'Chicken Tacos', 'Meat', 10, 15, 25, 4, '/recipe-images/chicken-tacos.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_chicken_tacos';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_chicken_tacos_1', 'recipe_chicken_tacos', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_chicken_tacos_2', 'recipe_chicken_tacos', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium onion, diced'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_tacos_3', 'recipe_chicken_tacos', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ground chicken'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_tacos_4', 'recipe_chicken_tacos', (SELECT "id" FROM "Ingredient" WHERE "name" = 'taco seasoning'), (SELECT "id" FROM "Measurement" WHERE "name" = 'packets'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chicken_tacos_5', 'recipe_chicken_tacos', (SELECT "id" FROM "Ingredient" WHERE "name" = 'taco sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_chicken_tacos';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_chicken_tacos_1', 'recipe_chicken_tacos', 1, 'Heat oil in a skillet and sauté the diced onion until softened.', NULL, NOW(), NOW()),
  ('step_chicken_tacos_2', 'recipe_chicken_tacos', 2, 'Add ground chicken and cook, breaking it up, until no longer pink.', NULL, NOW(), NOW()),
  ('step_chicken_tacos_3', 'recipe_chicken_tacos', 3, 'Stir in taco seasoning and taco sauce and simmer until saucy.', NULL, NOW(), NOW()),
  ('step_chicken_tacos_4', 'recipe_chicken_tacos', 4, 'Serve in tacos with desired toppings.', NULL, NOW(), NOW());

-- Chulent
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_chulent', 'Chulent', 'Meat', 20, 720, 740, 10, '/recipe-images/chulent.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_chulent';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_chulent_1', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Lior wheat berries'), (SELECT "id" FROM "Measurement" WHERE "name" = 'bag'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chulent_2', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'paprika'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_chulent_3', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cumin'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_chulent_4', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'kosher salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chulent_5', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'red pepper flakes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_chulent_6', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tomato paste'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_chulent_7', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2-3', NULL, NOW(), NOW()),
  ('ri_chulent_8', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'potatoes'), NULL, 3, '3-4', NULL, NOW(), NOW()),
  ('ri_chulent_9', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'short rib or beef cheek'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 2, '2-2.5', NULL, NOW(), NOW()),
  ('ri_chulent_10', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Marrow bones, optional'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_chulent_11', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'fresh garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 6, '6-8', NULL, NOW(), NOW()),
  ('ri_chulent_12', 'recipe_chulent', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Water or stock to cover'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_chulent';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_chulent_1', 'recipe_chulent', 1, 'Add wheat berries, spices, tomato paste, honey, potatoes, meat, marrow bones if using, and garlic to a slow cooker or oven-safe pot.', NULL, NOW(), NOW()),
  ('step_chulent_2', 'recipe_chulent', 2, 'Cover with water or stock.', NULL, NOW(), NOW()),
  ('step_chulent_3', 'recipe_chulent', 3, 'Cook very low and slow overnight, until the meat is tender and the chulent is thick.', NULL, NOW(), NOW());

-- KFC Fried Chicken
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_kfc_fried_chicken', 'KFC Fried Chicken', 'Meat', 390, 12, 402, 6, '/recipe-images/kfc-fried-chicken.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_kfc_fried_chicken';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_kfc_fried_chicken_1', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chicken'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 2, '2', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_2', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, '4', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_3', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_4', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_5', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'all purpose flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 3, '3', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_6', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'corn starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_7', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_8', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_9', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_10', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_11', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'paprika'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_12', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'onion powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_13', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white pepper'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_14', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'MSG'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_15', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 3, '3', NULL, NOW(), NOW()),
  ('ri_kfc_fried_chicken_16', 'recipe_kfc_fried_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sparkling water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_kfc_fried_chicken';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_kfc_fried_chicken_1', 'recipe_kfc_fried_chicken', 1, 'Brine the chicken in water with salt and sugar for 6 hours, then drain.', NULL, NOW(), NOW()),
  ('step_kfc_fried_chicken_2', 'recipe_kfc_fried_chicken', 2, 'Mix flour, corn starch, sugar, baking powder, salt, garlic powder, paprika, onion powder, white pepper, and MSG.', NULL, NOW(), NOW()),
  ('step_kfc_fried_chicken_3', 'recipe_kfc_fried_chicken', 3, 'Separate half of the flour mixture and mix it with eggs and sparkling water to make batter.', NULL, NOW(), NOW()),
  ('step_kfc_fried_chicken_4', 'recipe_kfc_fried_chicken', 4, 'Dip chicken in batter, dredge in the dry flour mixture, and fry at 350°F for about 12 minutes, until cooked through.', NULL, NOW(), NOW());

-- Laham B'agene
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_laham_bagene', 'Laham B''agene', 'Meat', 60, 26, 86, 8, '/recipe-images/laham-bagene.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_laham_bagene';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_laham_bagene_1', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_laham_bagene_2', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lukewarm water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_laham_bagene_3', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'yeast'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_laham_bagene_4', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_laham_bagene_5', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_laham_bagene_6', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Up to 1/2 cup additional water'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_laham_bagene_7', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ground beef'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 1.2, '1.2', NULL, NOW(), NOW()),
  ('ri_laham_bagene_8', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oot'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_laham_bagene_9', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ketchup'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.75, '3/4', NULL, NOW(), NOW()),
  ('ri_laham_bagene_10', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'small onion, ground'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_laham_bagene_11', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1.5, '1 1/2', NULL, NOW(), NOW()),
  ('ri_laham_bagene_12', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Sprinkle allspice'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_laham_bagene_13', 'recipe_laham_bagene', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Sprinkle cinnamon'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_laham_bagene';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_laham_bagene_1', 'recipe_laham_bagene', 1, 'Mix the flour, lukewarm water, yeast, salt, and oil with a dough hook, adding up to 1/2 cup more water gradually until a smooth dough forms.', NULL, NOW(), NOW()),
  ('step_laham_bagene_2', 'recipe_laham_bagene', 2, 'Mix the ground beef with oot, ketchup, ground onion, salt, allspice, and cinnamon. Marinate overnight if possible.', NULL, NOW(), NOW()),
  ('step_laham_bagene_3', 'recipe_laham_bagene', 3, 'Top portions of dough with the meat mixture.', NULL, NOW(), NOW()),
  ('step_laham_bagene_4', 'recipe_laham_bagene', 4, 'Bake at 350°F for 13 minutes, turn, and bake another 13 minutes.', NULL, NOW(), NOW());

-- Orange Chicken
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_orange_chicken', 'Orange Chicken', 'Meat', 25, 25, 50, 6, '/recipe-images/orange-chicken.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_orange_chicken';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_orange_chicken_1', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chicken, cubed'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 2, '2', NULL, NOW(), NOW()),
  ('ri_orange_chicken_2', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_orange_chicken_3', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white pepper'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_orange_chicken_4', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'corn starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_orange_chicken_5', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 3, '3', NULL, NOW(), NOW()),
  ('ri_orange_chicken_6', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'egg'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_orange_chicken_7', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_orange_chicken_8', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_orange_chicken_9', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_orange_chicken_10', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chili flakes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_orange_chicken_11', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_orange_chicken_12', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ginger, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_orange_chicken_13', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_orange_chicken_14', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_orange_chicken_15', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'orange juice'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_orange_chicken_16', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white vinegar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_orange_chicken_17', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'soy sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_orange_chicken_18', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_orange_chicken_19', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'corn starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_orange_chicken_20', 'recipe_orange_chicken', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sesame oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_orange_chicken';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_orange_chicken_1', 'recipe_orange_chicken', 1, 'Season cubed chicken with salt and white pepper. Make a batter with corn starch, flour, egg, water, and oil.', NULL, NOW(), NOW()),
  ('step_orange_chicken_2', 'recipe_orange_chicken', 2, 'Coat and fry the chicken until crisp and cooked through.', NULL, NOW(), NOW()),
  ('step_orange_chicken_3', 'recipe_orange_chicken', 3, 'For the sauce, heat oil with chili flakes, garlic, and ginger. Add sugars, orange juice, vinegar, soy sauce, water, corn starch, and sesame oil.', NULL, NOW(), NOW()),
  ('step_orange_chicken_4', 'recipe_orange_chicken', 4, 'Simmer until glossy, then toss with the fried chicken.', NULL, NOW(), NOW());

-- Poppers
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_poppers', 'Poppers', 'Meat', 25, 20, 45, 6, '/recipe-images/poppers.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_poppers';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_poppers_1', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'chicken breast'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 1.5, '1.5-2', NULL, NOW(), NOW()),
  ('ri_poppers_2', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'all purpose flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_poppers_3', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'corn starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_poppers_4', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_poppers_5', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_poppers_6', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_poppers_7', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'paprika'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_poppers_8', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'onion powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_poppers_9', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white pepper'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_poppers_10', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Egg wash'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_poppers_11', 'recipe_poppers', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Frank hot sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_poppers';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_poppers_1', 'recipe_poppers', 1, 'Cut chicken breast into bite-size poppers.', NULL, NOW(), NOW()),
  ('step_poppers_2', 'recipe_poppers', 2, 'Mix flour, corn starch, baking powder, salt, garlic powder, paprika, onion powder, and white pepper.', NULL, NOW(), NOW()),
  ('step_poppers_3', 'recipe_poppers', 3, 'Dip chicken into egg wash, then dredge in the seasoned flour mixture.', NULL, NOW(), NOW()),
  ('step_poppers_4', 'recipe_poppers', 4, 'Fry or bake until crisp and cooked through, then toss with Frank hot sauce or popper sauce.', NULL, NOW(), NOW());

-- Baked Ziti
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_baked_ziti', 'Baked Ziti', 'Dairy', 15, 35, 50, 6, '/recipe-images/baked-ziti.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_baked_ziti';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_baked_ziti_1', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ziti pasta'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_baked_ziti_2', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ricotta'), (SELECT "id" FROM "Measurement" WHERE "name" = 'oz'), 12, '12', NULL, NOW(), NOW()),
  ('ri_baked_ziti_3', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Parmesan'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_baked_ziti_4', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_baked_ziti_5', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'mozzarella/Muenster'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_baked_ziti_6', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Marinara sauce'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_baked_ziti_7', 'recipe_baked_ziti', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Fresh basil for topping'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_baked_ziti';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_baked_ziti_1', 'recipe_baked_ziti', 1, 'Cook the ziti until just under al dente and drain.', NULL, NOW(), NOW()),
  ('step_baked_ziti_2', 'recipe_baked_ziti', 2, 'Mix pasta with ricotta, Parmesan, salt, marinara, and some of the mozzarella or Muenster.', NULL, NOW(), NOW()),
  ('step_baked_ziti_3', 'recipe_baked_ziti', 3, 'Transfer to a baking dish, top with remaining cheese, and bake until bubbling.', NULL, NOW(), NOW()),
  ('step_baked_ziti_4', 'recipe_baked_ziti', 4, 'Finish with fresh basil.', NULL, NOW(), NOW());

-- Coosah
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_coosah', 'Coosah', 'Dairy', 20, 45, 65, 6, '/recipe-images/coosah.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_coosah';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_coosah_1', 'recipe_coosah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium onion'), NULL, 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_coosah_2', 'recipe_coosah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'zucchini squash'), NULL, 6, '6-7', NULL, NOW(), NOW()),
  ('ri_coosah_3', 'recipe_coosah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'mozzarella/Muenster cheese'), (SELECT "id" FROM "Measurement" WHERE "name" = 'oz'), 5, '5', NULL, NOW(), NOW()),
  ('ri_coosah_4', 'recipe_coosah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cottage cheese'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_coosah_5', 'recipe_coosah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 3, '3', NULL, NOW(), NOW()),
  ('ri_coosah_6', 'recipe_coosah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt to taste'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_coosah';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_coosah_1', 'recipe_coosah', 1, 'Prepare the onion and zucchini squash.', NULL, NOW(), NOW()),
  ('step_coosah_2', 'recipe_coosah', 2, 'Mix with mozzarella or Muenster, cottage cheese, eggs, and salt.', NULL, NOW(), NOW()),
  ('step_coosah_3', 'recipe_coosah', 3, 'Transfer to a baking dish and bake until set and golden.', NULL, NOW(), NOW());

-- Mac and Cheese
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_mac_and_cheese', 'Mac and Cheese', 'Dairy', 15, 30, 45, 8, '/recipe-images/mac-and-cheese.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_mac_and_cheese';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_mac_and_cheese_1', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'pasta'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 1, '1', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_2', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'American cheese'), (SELECT "id" FROM "Measurement" WHERE "name" = 'slices'), 6, '6', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_3', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Mozzarella/Muenster/Cheddar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'oz'), 8, '8', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_4', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salted butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_5', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'all purpose flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_6', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'whole milk'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, '4', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_7', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Sprinkle cayenne pepper'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_8', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Sprinkle paprika'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_9', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_10', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cornflake crumbs'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.75, '3/4', NULL, NOW(), NOW()),
  ('ri_mac_and_cheese_11', 'recipe_mac_and_cheese', (SELECT "id" FROM "Ingredient" WHERE "name" = 'melted butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 3, '3', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_mac_and_cheese';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_mac_and_cheese_1', 'recipe_mac_and_cheese', 1, 'Cook pasta until just al dente and drain.', NULL, NOW(), NOW()),
  ('step_mac_and_cheese_2', 'recipe_mac_and_cheese', 2, 'Make a roux with butter and flour, then whisk in milk until smooth and thickened.', NULL, NOW(), NOW()),
  ('step_mac_and_cheese_3', 'recipe_mac_and_cheese', 3, 'Melt in the cheeses and season with cayenne, paprika, and salt.', NULL, NOW(), NOW()),
  ('step_mac_and_cheese_4', 'recipe_mac_and_cheese', 4, 'Combine with pasta, top with cornflake crumbs mixed with melted butter, and bake until golden.', NULL, NOW(), NOW());

-- Mashed Potatoes
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_mashed_potatoes', 'Mashed Potatoes', 'Dairy', 15, 25, 40, 6, '/recipe-images/mashed-potatoes.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_mashed_potatoes';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_mashed_potatoes_1', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Yukon gold potatoes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 2, '2', NULL, NOW(), NOW()),
  ('ri_mashed_potatoes_2', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'unsalted/salted butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 4, '4', NULL, NOW(), NOW()),
  ('ri_mashed_potatoes_3', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Garlic confit'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_mashed_potatoes_4', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'dried thyme'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_mashed_potatoes_5', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'dried rosemary'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_mashed_potatoes_6', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'heavy cream'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_mashed_potatoes_7', 'recipe_mashed_potatoes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper to taste'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_mashed_potatoes';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_mashed_potatoes_1', 'recipe_mashed_potatoes', 1, 'Boil Yukon gold potatoes until tender, then drain.', NULL, NOW(), NOW()),
  ('step_mashed_potatoes_2', 'recipe_mashed_potatoes', 2, 'Mash with butter, garlic confit, thyme, rosemary, and heavy cream.', NULL, NOW(), NOW()),
  ('step_mashed_potatoes_3', 'recipe_mashed_potatoes', 3, 'Season with salt and pepper to taste.', NULL, NOW(), NOW());

-- Pancakes
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_pancakes', 'Pancakes', 'Dairy', 10, 20, 30, 6, '/recipe-images/pancakes.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_pancakes';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_pancakes_1', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 3, '3', NULL, NOW(), NOW()),
  ('ri_pancakes_2', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_pancakes_3', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1.5, '1 1/2', NULL, NOW(), NOW()),
  ('ri_pancakes_4', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking soda'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1.5, '1 1/2', NULL, NOW(), NOW()),
  ('ri_pancakes_5', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_pancakes_6', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'milk'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2.25, '2 1/4', NULL, NOW(), NOW()),
  ('ri_pancakes_7', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_pancakes_8', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_pancakes_9', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'apple cider vinegar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_pancakes_10', 'recipe_pancakes', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 3, '3', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_pancakes';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_pancakes_1', 'recipe_pancakes', 1, 'Whisk the dry ingredients together.', NULL, NOW(), NOW()),
  ('step_pancakes_2', 'recipe_pancakes', 2, 'Whisk milk, oil, vanilla, apple cider vinegar, and eggs separately.', NULL, NOW(), NOW()),
  ('step_pancakes_3', 'recipe_pancakes', 3, 'Combine wet and dry ingredients just until mixed.', NULL, NOW(), NOW()),
  ('step_pancakes_4', 'recipe_pancakes', 4, 'Cook pancakes on a greased griddle until bubbles form, then flip and cook through.', NULL, NOW(), NOW());

-- Shakshuka
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_shakshuka', 'Shakshuka', 'Dairy', 15, 30, 45, 6, '/recipe-images/shakshuka.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_shakshuka';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_shakshuka_1', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'pepper'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_shakshuka_2', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 6, '6', NULL, NOW(), NOW()),
  ('ri_shakshuka_3', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ripe tomatoes'), NULL, 5, '5', NULL, NOW(), NOW()),
  ('ri_shakshuka_4', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'fire roasted tomatoes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'can'), 2, '2', NULL, NOW(), NOW()),
  ('ri_shakshuka_5', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tomato paste'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_shakshuka_6', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'paprika in oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_shakshuka_7', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cumin'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_shakshuka_8', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'hot paprika'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_shakshuka_9', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper to taste'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_shakshuka_10', 'recipe_shakshuka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 6, '6', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_shakshuka';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_shakshuka_1', 'recipe_shakshuka', 1, 'Sauté the pepper and garlic until softened.', NULL, NOW(), NOW()),
  ('step_shakshuka_2', 'recipe_shakshuka', 2, 'Add fresh tomatoes, fire roasted tomatoes, tomato paste, paprika in oil, cumin, hot paprika, salt, and pepper. Simmer until thick.', NULL, NOW(), NOW()),
  ('step_shakshuka_3', 'recipe_shakshuka', 3, 'Make wells in the sauce, crack in the eggs, cover, and cook until the eggs are set to your liking.', NULL, NOW(), NOW());

-- Spanach
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_spanach', 'Spanach', 'Dairy', 15, 35, 50, 6, '/recipe-images/spanach.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_spanach';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_spanach_1', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_spanach_2', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium onion, diced'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_spanach_3', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'spinach'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 2, '2-2.5', NULL, NOW(), NOW()),
  ('ri_spanach_4', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 3, '3-4', NULL, NOW(), NOW()),
  ('ri_spanach_5', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cottage cheese'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_spanach_6', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'shredded mozzarella'), (SELECT "id" FROM "Measurement" WHERE "name" = 'oz'), 8, '8', NULL, NOW(), NOW()),
  ('ri_spanach_7', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper to taste'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_spanach_8', 'recipe_spanach', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Little garlic powder'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_spanach';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_spanach_1', 'recipe_spanach', 1, 'Heat oil and sauté the diced onion until softened.', NULL, NOW(), NOW()),
  ('step_spanach_2', 'recipe_spanach', 2, 'Add spinach and cook until wilted, then drain excess liquid if needed.', NULL, NOW(), NOW()),
  ('step_spanach_3', 'recipe_spanach', 3, 'Mix with eggs, cottage cheese, mozzarella, salt, pepper, and a little garlic powder.', NULL, NOW(), NOW()),
  ('step_spanach_4', 'recipe_spanach', 4, 'Bake until set and lightly golden.', NULL, NOW(), NOW());

-- Spicy Penne Vodka
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_spicy_penne_vodka', 'Spicy Penne Vodka', 'Dairy', 15, 25, 40, 6, '/recipe-images/spicy-penne-vodka.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_spicy_penne_vodka';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_spicy_penne_vodka_1', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_2', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium onion, finely diced'), NULL, 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_3', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 2, '2', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_4', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tomato paste'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_5', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vodka'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_6', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'heavy cream'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_7', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'crushed red pepper flakes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_8', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salted butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_9', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Freshly grated Parmesan'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_spicy_penne_vodka_10', 'recipe_spicy_penne_vodka', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper to taste'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_spicy_penne_vodka';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_spicy_penne_vodka_1', 'recipe_spicy_penne_vodka', 1, 'Sauté onion in olive oil until soft, then add garlic.', NULL, NOW(), NOW()),
  ('step_spicy_penne_vodka_2', 'recipe_spicy_penne_vodka', 2, 'Stir in tomato paste and cook until deepened in color.', NULL, NOW(), NOW()),
  ('step_spicy_penne_vodka_3', 'recipe_spicy_penne_vodka', 3, 'Add vodka and cook briefly. Stir in heavy cream, crushed red pepper flakes, and butter.', NULL, NOW(), NOW()),
  ('step_spicy_penne_vodka_4', 'recipe_spicy_penne_vodka', 4, 'Toss with cooked penne and finish with Parmesan, salt, and pepper.', NULL, NOW(), NOW());

-- French Onion Soup
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_french_onion_soup', 'French Onion Soup', 'Soups', 15, 75, 90, 6, '/recipe-images/french-onion-soup.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_french_onion_soup';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_french_onion_soup_1', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Vidalia onions'), NULL, 6, '6-7', NULL, NOW(), NOW()),
  ('ri_french_onion_soup_2', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_french_onion_soup_3', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_french_onion_soup_4', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Red wine to deglaze'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_french_onion_soup_5', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'veggie broth'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, '4', NULL, NOW(), NOW()),
  ('ri_french_onion_soup_6', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, '4', NULL, NOW(), NOW()),
  ('ri_french_onion_soup_7', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Telma beef bouillon, optional'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cube'), 1, '1', NULL, NOW(), NOW()),
  ('ri_french_onion_soup_8', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Couple sprigs thyme'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_french_onion_soup_9', 'recipe_french_onion_soup', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper to taste'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_french_onion_soup';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_french_onion_soup_1', 'recipe_french_onion_soup', 1, 'Slice the onions and cook slowly in olive oil and butter until deeply caramelized.', NULL, NOW(), NOW()),
  ('step_french_onion_soup_2', 'recipe_french_onion_soup', 2, 'Deglaze with red wine.', NULL, NOW(), NOW()),
  ('step_french_onion_soup_3', 'recipe_french_onion_soup', 3, 'Add veggie broth, water, bouillon if using, thyme, salt, and pepper.', NULL, NOW(), NOW()),
  ('step_french_onion_soup_4', 'recipe_french_onion_soup', 4, 'Simmer until rich and flavorful.', NULL, NOW(), NOW());

-- Asian Slaw Dressing
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_asian_slaw_dressing', 'Asian Slaw Dressing', 'Parve', 10, 0, 10, 8, '/recipe-images/asian-slaw-dressing.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_asian_slaw_dressing';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_asian_slaw_dressing_1', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'rice vinegar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_2', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'soy sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_3', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 3, '3', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_4', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'neutral oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_5', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'neutral oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_6', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'toasted sesame oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_7', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ginger, grated'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_8', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic cloves, grated'), NULL, 2, '2', NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_9', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Juice of one lime'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_asian_slaw_dressing_10', 'recipe_asian_slaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Pinch of red pepper flakes'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_asian_slaw_dressing';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_asian_slaw_dressing_1', 'recipe_asian_slaw_dressing', 1, 'Whisk rice vinegar, soy sauce, honey, neutral oil, toasted sesame oil, ginger, garlic, lime juice, and red pepper flakes until emulsified.', NULL, NOW(), NOW()),
  ('step_asian_slaw_dressing_2', 'recipe_asian_slaw_dressing', 2, 'Toss with slaw or refrigerate until ready to use.', NULL, NOW(), NOW());

-- Coleslaw Dressing
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_coleslaw_dressing', 'Coleslaw Dressing', 'Parve', 10, 0, 10, 8, '/recipe-images/coleslaw-dressing.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_coleslaw_dressing';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_coleslaw_dressing_1', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'mayonnaise'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_2', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'grainy mustard'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_3', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white vinegar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_4', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_5', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, pressed'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 3, '3', NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_6', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Juice of 1/2 lemon'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_7', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_coleslaw_dressing_8', 'recipe_coleslaw_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'black pepper'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_coleslaw_dressing';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_coleslaw_dressing_1', 'recipe_coleslaw_dressing', 1, 'Whisk mayonnaise, grainy mustard, vinegar, sugar, pressed garlic, lemon juice, salt, and black pepper until smooth.', NULL, NOW(), NOW()),
  ('step_coleslaw_dressing_2', 'recipe_coleslaw_dressing', 2, 'Toss with shredded cabbage or chill until ready to use.', NULL, NOW(), NOW());

-- Cookie Butter Sauce
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_cookie_butter_sauce', 'Cookie Butter Sauce', 'Desserts', 5, 10, 15, 8, '/recipe-images/cookie-butter-sauce.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_cookie_butter_sauce';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_cookie_butter_sauce_1', 'recipe_cookie_butter_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_cookie_butter_sauce_2', 'recipe_cookie_butter_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.75, '3/4', NULL, NOW(), NOW()),
  ('ri_cookie_butter_sauce_3', 'recipe_cookie_butter_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cookie butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_cookie_butter_sauce_4', 'recipe_cookie_butter_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_cookie_butter_sauce_5', 'recipe_cookie_butter_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Pinch of salt'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_cookie_butter_sauce';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_cookie_butter_sauce_1', 'recipe_cookie_butter_sauce', 1, 'Simmer sugar and water until the sugar dissolves.', NULL, NOW(), NOW()),
  ('step_cookie_butter_sauce_2', 'recipe_cookie_butter_sauce', 2, 'Whisk in cookie butter, vanilla, and salt until smooth.', NULL, NOW(), NOW()),
  ('step_cookie_butter_sauce_3', 'recipe_cookie_butter_sauce', 3, 'Cool slightly before serving.', NULL, NOW(), NOW());

-- Dumpling Sauce
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_dumpling_sauce', 'Dumpling Sauce', 'Parve', 10, 0, 10, 6, '/recipe-images/dumpling-sauce.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_dumpling_sauce';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_dumpling_sauce_1', 'recipe_dumpling_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'minced garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 4, '4', NULL, NOW(), NOW()),
  ('ri_dumpling_sauce_2', 'recipe_dumpling_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'soy sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_dumpling_sauce_3', 'recipe_dumpling_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_dumpling_sauce_4', 'recipe_dumpling_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sriracha'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_dumpling_sauce_5', 'recipe_dumpling_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'rice vinegar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_dumpling_sauce_6', 'recipe_dumpling_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_dumpling_sauce';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_dumpling_sauce_1', 'recipe_dumpling_sauce', 1, 'Whisk garlic, soy sauce, honey, sriracha, rice vinegar, and water together.', NULL, NOW(), NOW()),
  ('step_dumpling_sauce_2', 'recipe_dumpling_sauce', 2, 'Serve with dumplings or use as a dipping sauce.', NULL, NOW(), NOW());

-- Marinara Sauce
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_marinara_sauce', 'Marinara Sauce', 'Parve', 10, 35, 45, 6, '/recipe-images/marinara-sauce.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_marinara_sauce';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_marinara_sauce_1', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_marinara_sauce_2', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'medium yellow onion'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_marinara_sauce_3', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic, minced'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 4, '4', NULL, NOW(), NOW()),
  ('ri_marinara_sauce_4', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_marinara_sauce_5', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'crushed tomatoes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'can'), 1, '1', NULL, NOW(), NOW()),
  ('ri_marinara_sauce_6', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'red pepper flakes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_marinara_sauce_7', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Bunch of fresh basil'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_marinara_sauce_8', 'recipe_marinara_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt to taste'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_marinara_sauce';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_marinara_sauce_1', 'recipe_marinara_sauce', 1, 'Sauté onion in olive oil until soft.', NULL, NOW(), NOW()),
  ('step_marinara_sauce_2', 'recipe_marinara_sauce', 2, 'Add garlic and cook briefly.', NULL, NOW(), NOW()),
  ('step_marinara_sauce_3', 'recipe_marinara_sauce', 3, 'Add sugar, crushed tomatoes, red pepper flakes, basil, and salt.', NULL, NOW(), NOW()),
  ('step_marinara_sauce_4', 'recipe_marinara_sauce', 4, 'Simmer until the sauce thickens and the flavors come together.', NULL, NOW(), NOW());

-- Popper Sauce
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_popper_sauce', 'Popper Sauce', 'Parve', 5, 10, 15, 8, '/recipe-images/popper-sauce.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_popper_sauce';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_popper_sauce_1', 'recipe_popper_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Frank hot sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_popper_sauce_2', 'recipe_popper_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.666667, '2/3', NULL, NOW(), NOW()),
  ('ri_popper_sauce_3', 'recipe_popper_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_popper_sauce';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_popper_sauce_1', 'recipe_popper_sauce', 1, 'Combine Frank hot sauce, brown sugar, and honey in a saucepan.', NULL, NOW(), NOW()),
  ('step_popper_sauce_2', 'recipe_popper_sauce', 2, 'Simmer until the sugar dissolves and the sauce is glossy.', NULL, NOW(), NOW()),
  ('step_popper_sauce_3', 'recipe_popper_sauce', 3, 'Toss with poppers or serve on the side.', NULL, NOW(), NOW());

-- Special Sauce
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_special_sauce', 'Special Sauce', 'Parve', 10, 0, 10, 8, '/recipe-images/special-sauce.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_special_sauce';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_special_sauce_1', 'recipe_special_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'mayonnaise'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_special_sauce_2', 'recipe_special_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ketchup'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_special_sauce_3', 'recipe_special_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'yellow mustard'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_special_sauce_4', 'recipe_special_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'dill relish'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_special_sauce_5', 'recipe_special_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Worcestershire'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_special_sauce_6', 'recipe_special_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt and pepper to taste'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_special_sauce';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_special_sauce_1', 'recipe_special_sauce', 1, 'Stir mayonnaise, ketchup, mustard, dill relish, Worcestershire, salt, and pepper together until smooth.', NULL, NOW(), NOW()),
  ('step_special_sauce_2', 'recipe_special_sauce', 2, 'Chill until ready to serve.', NULL, NOW(), NOW());

-- Tehine Dressing
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_tehine_dressing', 'Tehine Dressing', 'Parve', 10, 0, 10, 8, '/recipe-images/tehine-dressing.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_tehine_dressing';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_tehine_dressing_1', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'olive oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_tehine_dressing_2', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'tahini'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_tehine_dressing_3', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lemon juice'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_tehine_dressing_4', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'garlic clove, pressed'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_tehine_dressing_5', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1-2', NULL, NOW(), NOW()),
  ('ri_tehine_dressing_6', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Salt to taste'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_tehine_dressing_7', 'recipe_tehine_dressing', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Cold water to emulsify'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_tehine_dressing';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_tehine_dressing_1', 'recipe_tehine_dressing', 1, 'Whisk olive oil, tahini, lemon juice, pressed garlic, honey, and salt.', NULL, NOW(), NOW()),
  ('step_tehine_dressing_2', 'recipe_tehine_dressing', 2, 'Add cold water a little at a time until the dressing emulsifies and reaches the desired texture.', NULL, NOW(), NOW());

-- Teriyaki Sauce
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_teriyaki_sauce', 'Teriyaki Sauce', 'Parve', 5, 10, 15, 8, '/recipe-images/teriyaki-sauce.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_teriyaki_sauce';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_teriyaki_sauce_1', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'soy sauce'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_2', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_3', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'freshly grated ginger'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_4', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'freshly grated garlic'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cloves'), 4, '4', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_5', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 3, '3', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_6', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'honey'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_7', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'red pepper flakes'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_8', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'corn starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_teriyaki_sauce_9', 'recipe_teriyaki_sauce', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 2, '2', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_teriyaki_sauce';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_teriyaki_sauce_1', 'recipe_teriyaki_sauce', 1, 'Combine soy sauce, water, ginger, garlic, brown sugar, honey, and red pepper flakes in a saucepan and simmer briefly.', NULL, NOW(), NOW()),
  ('step_teriyaki_sauce_2', 'recipe_teriyaki_sauce', 2, 'Mix corn starch with water to make a slurry.', NULL, NOW(), NOW()),
  ('step_teriyaki_sauce_3', 'recipe_teriyaki_sauce', 3, 'Whisk the slurry into the sauce and simmer until thickened.', NULL, NOW(), NOW());

-- Blue and White Cookies
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_blue_and_white_cookies', 'Blue and White Cookies', 'Desserts', 25, 12, 37, 12, '/recipe-images/blue-and-white-cookies.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_blue_and_white_cookies';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_blue_and_white_cookies_1', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_2', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'neutral oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_3', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'large egg'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_4', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'plain non-dairy yogurt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_5', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_6', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'lemon juice'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_7', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'non-dairy milk'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_8', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'all-purpose flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_9', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking soda'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_10', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_11', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sea salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_12', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'powdered sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_13', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'hot water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2-4', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_14', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_15', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'light corn syrup'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_blue_and_white_cookies_16', 'recipe_blue_and_white_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Blue food coloring'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_blue_and_white_cookies';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_blue_and_white_cookies_1', 'recipe_blue_and_white_cookies', 1, 'Mix sugar, oil, egg, non-dairy yogurt, vanilla, lemon juice, and non-dairy milk.', NULL, NOW(), NOW()),
  ('step_blue_and_white_cookies_2', 'recipe_blue_and_white_cookies', 2, 'Add flour, baking soda, baking powder, and sea salt and mix into a soft dough.', NULL, NOW(), NOW()),
  ('step_blue_and_white_cookies_3', 'recipe_blue_and_white_cookies', 3, 'Scoop and bake cookies until set. Cool completely.', NULL, NOW(), NOW()),
  ('step_blue_and_white_cookies_4', 'recipe_blue_and_white_cookies', 4, 'Mix powdered sugar, hot water, vanilla, and corn syrup into a glaze. Tint half blue and glaze the cookies blue and white.', NULL, NOW(), NOW());

-- Blueberry Crisp
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_blueberry_crisp', 'Blueberry Crisp', 'Desserts', 15, 50, 65, 8, '/recipe-images/blueberry-crisp.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_blueberry_crisp';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_blueberry_crisp_1', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'blueberries'), (SELECT "id" FROM "Measurement" WHERE "name" = 'packages'), 2, '2', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_2', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'soft peaches'), NULL, 3, '3-4', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_3', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_4', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_5', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'maple syrup'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_6', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_7', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Dash of cinnamon'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_8', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_9', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oats'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_10', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_11', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_12', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'pecans, crushed'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_blueberry_crisp_13', 'recipe_blueberry_crisp', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Dash of cinnamon'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_blueberry_crisp';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_blueberry_crisp_1', 'recipe_blueberry_crisp', 1, 'Mix blueberries and peaches with brown sugar, flour, maple syrup, vanilla, and cinnamon.', NULL, NOW(), NOW()),
  ('step_blueberry_crisp_2', 'recipe_blueberry_crisp', 2, 'Mix flour, oats, brown sugar, oil, pecans, and cinnamon for the topping.', NULL, NOW(), NOW()),
  ('step_blueberry_crisp_3', 'recipe_blueberry_crisp', 3, 'Spread fruit in a baking dish, sprinkle topping over it, and bake until bubbling and golden.', NULL, NOW(), NOW());

-- Chocolate Chip Cookies
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_chocolate_chip_cookies', 'Chocolate Chip Cookies', 'Desserts', 20, 12, 32, 18, '/recipe-images/chocolate-chip-cookies.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_chocolate_chip_cookies';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_chocolate_chip_cookies_1', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'unsalted browned butter'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_2', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'brown sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.666667, '2/3', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_3', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_4', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'large egg yolk'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_5', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'large egg'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_6', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_7', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'all purpose flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 2, '2', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_8', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking soda'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.75, '3/4', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_9', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_chocolate_chip_cookies_10', 'recipe_chocolate_chip_cookies', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Chocolate chunks'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_chocolate_chip_cookies';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_chocolate_chip_cookies_1', 'recipe_chocolate_chip_cookies', 1, 'Brown the butter and let it cool slightly.', NULL, NOW(), NOW()),
  ('step_chocolate_chip_cookies_2', 'recipe_chocolate_chip_cookies', 2, 'Mix butter with brown sugar and white sugar, then add egg yolk, egg, and vanilla.', NULL, NOW(), NOW()),
  ('step_chocolate_chip_cookies_3', 'recipe_chocolate_chip_cookies', 3, 'Stir in flour, baking soda, salt, and chocolate chunks.', NULL, NOW(), NOW()),
  ('step_chocolate_chip_cookies_4', 'recipe_chocolate_chip_cookies', 4, 'Scoop and bake until edges are set and centers are soft.', NULL, NOW(), NOW());

-- Spelt Banana Muffins
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_spelt_banana_muffins', 'Spelt Banana Muffins', 'Desserts', 15, 20, 35, 12, '/recipe-images/spelt-banana-muffins.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_spelt_banana_muffins';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_spelt_banana_muffins_1', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'ripe bananas, mashed'), NULL, 2, '2', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_2', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'maple syrup'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 3, '3', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_3', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'coconut oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 3, '3', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_4', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'almond milk'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 3, '3', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_5', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'vanilla extract'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_6', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'large egg'), NULL, 1, '1', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_7', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'white spelt flour'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_8', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking powder'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_9', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'baking soda'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_10', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sea salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_spelt_banana_muffins_11', 'recipe_spelt_banana_muffins', (SELECT "id" FROM "Ingredient" WHERE "name" = 'mini chocolate chips'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.333333, '1/3', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_spelt_banana_muffins';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_spelt_banana_muffins_1', 'recipe_spelt_banana_muffins', 1, 'Mix mashed bananas, maple syrup, coconut oil, almond milk, vanilla, and egg.', NULL, NOW(), NOW()),
  ('step_spelt_banana_muffins_2', 'recipe_spelt_banana_muffins', 2, 'Stir in spelt flour, baking powder, baking soda, sea salt, and mini chocolate chips.', NULL, NOW(), NOW()),
  ('step_spelt_banana_muffins_3', 'recipe_spelt_banana_muffins', 3, 'Divide into muffin cups and bake until a tester comes out clean.', NULL, NOW(), NOW());

-- Turkish Delight
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_turkish_delight', 'Turkish Delight', 'Desserts', 15, 75, 90, 24, '/recipe-images/turkish-delight.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_turkish_delight';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_turkish_delight_1', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, '4', NULL, NOW(), NOW()),
  ('ri_turkish_delight_2', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_turkish_delight_3', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'corn starch'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_turkish_delight_4', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'cream of tartar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_turkish_delight_5', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 3, '3', NULL, NOW(), NOW()),
  ('ri_turkish_delight_6', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'rose water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_turkish_delight_7', 'recipe_turkish_delight', (SELECT "id" FROM "Ingredient" WHERE "name" = 'Optional red food coloring'), NULL, 0, NULL, NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_turkish_delight';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_turkish_delight_1', 'recipe_turkish_delight', 1, 'Cook sugar with 1.5 cups water to 240°F.', NULL, NOW(), NOW()),
  ('step_turkish_delight_2', 'recipe_turkish_delight', 2, 'In a separate pot, combine corn starch, cream of tartar, and 3 cups water.', NULL, NOW(), NOW()),
  ('step_turkish_delight_3', 'recipe_turkish_delight', 3, 'Stir the mixtures together and cook for about 1 hour, stirring often, until thick.', NULL, NOW(), NOW()),
  ('step_turkish_delight_4', 'recipe_turkish_delight', 4, 'Stir in rose water and optional red food coloring, then pour into a prepared pan to set.', NULL, NOW(), NOW());

-- Challah
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_challah', 'Challah', 'Parve', 150, 35, 185, 16, '/recipe-images/challah.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_challah';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_challah_1', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'instant rise yeast'), (SELECT "id" FROM "Measurement" WHERE "name" = 'packets'), 4, '4', NULL, NOW(), NOW()),
  ('ri_challah_2', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1, '1', NULL, NOW(), NOW()),
  ('ri_challah_3', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'warm water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 4, '4', NULL, NOW(), NOW()),
  ('ri_challah_4', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'bag flour, sifted'), (SELECT "id" FROM "Measurement" WHERE "name" = 'lb'), 5, '5', NULL, NOW(), NOW()),
  ('ri_challah_5', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sugar'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1, '1', NULL, NOW(), NOW()),
  ('ri_challah_6', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'oil plus one squirt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.5, '1/2', NULL, NOW(), NOW()),
  ('ri_challah_7', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'eggs'), NULL, 4, '4', NULL, NOW(), NOW()),
  ('ri_challah_8', 'recipe_challah', (SELECT "id" FROM "Ingredient" WHERE "name" = 'kosher salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 4, '4', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_challah';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_challah_1', 'recipe_challah', 1, 'Proof yeast with 1 tbsp sugar and warm water.', NULL, NOW(), NOW()),
  ('step_challah_2', 'recipe_challah', 2, 'Add sifted flour, sugar, oil, eggs, and kosher salt and knead until smooth.', NULL, NOW(), NOW()),
  ('step_challah_3', 'recipe_challah', 3, 'Let rise until doubled, then shape into challahs.', NULL, NOW(), NOW()),
  ('step_challah_4', 'recipe_challah', 4, 'Let rise again and bake until golden and cooked through.', NULL, NOW(), NOW());

-- Challah (Spelt)
INSERT INTO "Recipe" ("id", "name", "category", "prepTime", "cookTime", "totalTime", "serves", "imageUrl", "published", "createdAt", "updatedAt")
VALUES ('recipe_challah_spelt', 'Challah (Spelt)', 'Parve', 130, 35, 165, 10, '/recipe-images/challah-spelt.jpg', true, NOW(), NOW())
ON CONFLICT ("id") DO UPDATE SET "name"=EXCLUDED."name", "category"=EXCLUDED."category", "prepTime"=EXCLUDED."prepTime", "cookTime"=EXCLUDED."cookTime", "totalTime"=EXCLUDED."totalTime", "serves"=EXCLUDED."serves", "imageUrl"=EXCLUDED."imageUrl", "published"=EXCLUDED."published", "updatedAt"=NOW();
DELETE FROM "RecipeIngredient" WHERE "recipeId" = 'recipe_challah_spelt';
INSERT INTO "RecipeIngredient" ("id", "recipeId", "ingredientId", "measurementId", "amount", "amountText", "section", "createdAt", "updatedAt") VALUES
  ('ri_challah_spelt_1', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = '360g white spelt flour'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_challah_spelt_2', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = '300g whole spelt flour'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_challah_spelt_3', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = 'yeast'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 1.5, '1.5', NULL, NOW(), NOW()),
  ('ri_challah_spelt_4', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = '60g sugar'), NULL, 0, NULL, NULL, NOW(), NOW()),
  ('ri_challah_spelt_5', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = 'avocado oil'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 0.25, '1/4', NULL, NOW(), NOW()),
  ('ri_challah_spelt_6', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = 'sea salt'), (SELECT "id" FROM "Measurement" WHERE "name" = 'tbsp'), 2, '2', NULL, NOW(), NOW()),
  ('ri_challah_spelt_7', 'recipe_challah_spelt', (SELECT "id" FROM "Ingredient" WHERE "name" = 'warm water'), (SELECT "id" FROM "Measurement" WHERE "name" = 'cups'), 1.66667, '1 2/3', NULL, NOW(), NOW());
DELETE FROM "InstructionStep" WHERE "recipeId" = 'recipe_challah_spelt';
INSERT INTO "InstructionStep" ("id", "recipeId", "stepNumber", "text", "imageUrl", "createdAt", "updatedAt") VALUES
  ('step_challah_spelt_1', 'recipe_challah_spelt', 1, 'Mix white spelt flour, whole spelt flour, yeast, sugar, avocado oil, sea salt, and warm water, adding more water if needed.', NULL, NOW(), NOW()),
  ('step_challah_spelt_2', 'recipe_challah_spelt', 2, 'Knead gently until a smooth dough forms.', NULL, NOW(), NOW()),
  ('step_challah_spelt_3', 'recipe_challah_spelt', 3, 'Let rise, shape, rise again, and bake until golden.', NULL, NOW(), NOW());

COMMIT;
