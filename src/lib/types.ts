export type RecipeSummary = {
  id: string;
  name: string;
  category?: string | null;
  totalTime?: number | null;
  imageUrl?: string | null;
  published?: boolean;
};

export type Ingredient = {
  id: string;
  name: string;
  recipeCount?: number;
};

export type Measurement = {
  id: string;
  name: string;
};

export type RecipeIngredient = {
  id?: string;
  ingredientId?: string;
  measurementId?: string | null;
  amount?: number;
  section?: string | null;
  ingredient?: Ingredient | null;
  measurement?: Measurement | null;
};

export type RecipeStep = {
  id?: string;
  text: string;
  stepNumber: number;
  imageUrl?: string | null;
};

export type Recipe = RecipeSummary & {
  prepTime?: number | null;
  cookTime?: number | null;
  serves?: number | null;
  totalTime?: number | null;
  ingredients?: RecipeIngredient[];
  steps?: RecipeStep[];
};

export type Comment = {
  id: string;
  name: string;
  email: string;
  rating: number;
  comment: string;
  createdAt?: string | null;
  recipe?: RecipeSummary | null;
};

export type RecipeFormIngredientRow = {
  type: "ingredient";
  ingredientId: string;
  ingredientName: string;
  measurementId: string;
  measurementName: string;
  amount: string | number;
};

export type RecipeFormSectionRow = {
  type: "section";
  title: string;
};

export type RecipeFormRow = RecipeFormIngredientRow | RecipeFormSectionRow;

export type RecipeFormStep = {
  text: string;
  imageUrl: string;
};

export type RecipeFormState = {
  name: string;
  category: string;
  prepTime: number | string;
  cookTime: number | string;
  serves: number | string;
  imageUrl: string;
  ingredients: RecipeFormRow[];
  steps: RecipeFormStep[];
};

export type RecipePayload = {
  name: string;
  category: string;
  prepTime: number;
  cookTime: number;
  serves: number;
  imageUrl: string | null;
  ingredients: Array<{
    ingredientId: string;
    measurementId: string | null;
    amount: number;
    section?: string | null;
  }>;
  steps: Array<{
    text: string;
    imageUrl: string | null;
    stepNumber: number;
  }>;
};
