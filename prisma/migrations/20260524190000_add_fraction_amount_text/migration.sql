-- Preserve user-entered recipe quantities exactly as typed (for example 1/3 cup), while keeping numeric amount for scaling.
ALTER TABLE "RecipeIngredient" ADD COLUMN IF NOT EXISTS "amountText" TEXT;

-- Backfill known source fractions that were previously converted to decimals.
UPDATE "RecipeIngredient" SET "amountText" = '1 1/2' WHERE "id" = 'ri_beef_chili_chili_powder';
UPDATE "RecipeIngredient" SET "amountText" = '1/4' WHERE "id" = 'ri_teriyaki_salmon_soy';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_teriyaki_salmon_mustard';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_teriyaki_salmon_honey';
UPDATE "RecipeIngredient" SET "amountText" = '1/3' WHERE "id" = 'ri_boba_1';
UPDATE "RecipeIngredient" SET "amountText" = '1/3' WHERE "id" = 'ri_boba_2';
UPDATE "RecipeIngredient" SET "amountText" = '1 1/4' WHERE "id" = 'ri_boba_6';
UPDATE "RecipeIngredient" SET "amountText" = '1 1/2' WHERE "id" = 'ri_lentil_soup_8';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_lentil_soup_9';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_vegetable_soup_4';
UPDATE "RecipeIngredient" SET "amountText" = '1 1/4' WHERE "id" = 'ri_vegetable_soup_9';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_vegetable_soup_11';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_vegetable_soup_12';
UPDATE "RecipeIngredient" SET "amountText" = '2/3' WHERE "id" = 'ri_apple_crisp_2';
UPDATE "RecipeIngredient" SET "amountText" = '3/4' WHERE "id" = 'ri_apple_crisp_5';
UPDATE "RecipeIngredient" SET "amountText" = '3/4' WHERE "id" = 'ri_apple_crisp_6';
UPDATE "RecipeIngredient" SET "amountText" = '1/4' WHERE "id" = 'ri_apple_crisp_7';
UPDATE "RecipeIngredient" SET "amountText" = '1/3' WHERE "id" = 'ri_apple_crisp_8';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_apple_crisp_9';
UPDATE "RecipeIngredient" SET "amountText" = '1 3/4' WHERE "id" = 'ri_banana_bread_1';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_banana_bread_3';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_banana_bread_4';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_banana_bread_6';
UPDATE "RecipeIngredient" SET "amountText" = '1/4' WHERE "id" = 'ri_banana_bread_7';
UPDATE "RecipeIngredient" SET "amountText" = '1/2' WHERE "id" = 'ri_banana_bread_12';
