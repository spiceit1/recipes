-- Add durable checked-in image for Teriyaki Salmon.
-- Source: Wikimedia Commons / Flickr, "B-Dama's Salmon Teriyaki Bowl. a.k.a. The anti-sisig. :)" by Arnold Gatilao.
-- License: CC BY 2.0, https://creativecommons.org/licenses/by/2.0/
-- Source page: https://commons.wikimedia.org/wiki/File:B-Dama%27s_Salmon_Teriyaki_Bowl._a.k.a._The_anti-sisig._-)_(14954283259).jpg
UPDATE "Recipe"
SET "imageUrl" = '/recipe-images/teriyaki-salmon.jpg',
    "updatedAt" = CURRENT_TIMESTAMP
WHERE "id" = 'recipe_teriyaki_salmon';
