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
const { scaleAmount } = await import(moduleUrl);

assert.equal(scaleAmount("1/3", 1), "1/3", "keeps typed simple fractions unchanged at 1x scale");
assert.equal(scaleAmount("1 1/4", 1), "1 1/4", "keeps typed mixed fractions unchanged at 1x scale");
assert.equal(scaleAmount("1/3", 2), "2/3", "scales simple fractions as fractions");
assert.equal(scaleAmount("1 1/4", 2), "2 1/2", "scales mixed fractions as fractions");
assert.equal(scaleAmount("0", 1), "", "zero amount remains blank for free-form lines");

console.log("calculations tests passed");
