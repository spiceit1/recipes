-- Add a main image for Beef Chili.
-- Image source: Wikimedia Commons, CC0 Public Domain
-- https://commons.wikimedia.org/wiki/File:Chili_con_carne_with_beef,_beans,_chili_peppers,_garlic,_black_pepper,_and_a_soft-boiled_egg_-_Massachusetts.jpg

UPDATE "Recipe"
SET "imageUrl" = '/recipe-images/beef-chili.jpg',
    "updatedAt" = CURRENT_TIMESTAMP
WHERE "id" = 'recipe_beef_chili';
