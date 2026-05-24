import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import ts from "typescript";

const source = readFileSync(new URL("../src/lib/calculations.ts", import.meta.url), "utf8");
const { outputText } = ts.transpileModule(source, {
  compilerOptions: {
    module: ts.ModuleKind.ES2022,
    target: ts.ScriptTarget.ES2022,
  },
});
const moduleUrl = `data:text/javascript;base64,${Buffer.from(outputText).toString("base64")}`;
const { formatIngredientQuantity, scaleAmount } = await import(moduleUrl);

assert.equal(scaleAmount("1/3", 1), "1/3", "keeps typed simple fractions unchanged at 1x scale");
assert.equal(scaleAmount("1 1/4", 1), "1 1/4", "keeps typed mixed fractions unchanged at 1x scale");
assert.equal(scaleAmount("1/3", 2), "2/3", "scales simple fractions as fractions");
assert.equal(scaleAmount("1 1/4", 2), "2 1/2", "scales mixed fractions as fractions");
assert.equal(scaleAmount("0", 1), "", "zero amount remains blank for free-form lines");

assert.equal(formatIngredientQuantity("1", "cups"), "1 cup", "exactly 1 uses singular measurement");
assert.equal(formatIngredientQuantity("1/3", "cups"), "1/3 cup", "fractions under 1 use singular measurement");
assert.equal(formatIngredientQuantity("1 1/3", "cups"), "1 1/3 cups", "amounts over 1 use plural measurement");
assert.equal(formatIngredientQuantity("2", "cups"), "2 cups", "amounts over 1 keep plural measurement");
assert.equal(formatIngredientQuantity("1/2", "tablespoons"), "1/2 tablespoon", "other measurements singularize under 1");
assert.equal(formatIngredientQuantity("1 1/2", "teaspoons"), "1 1/2 teaspoons", "other measurements pluralize over 1");
assert.equal(formatIngredientQuantity("", "cups"), "", "blank amounts do not show a measurement by itself");

console.log("calculations tests passed");
