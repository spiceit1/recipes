export const formatTime = (minutes: number): string => {
  if (!Number.isFinite(minutes)) {
    return "0";
  }
  return `${minutes}`;
};

export const getTotalTime = (prepTime: number | null, cookTime: number | null): number =>
  Number(prepTime || 0) + Number(cookTime || 0);

const gcd = (a: number, b: number): number => {
  let x = Math.abs(a);
  let y = Math.abs(b);
  while (y) {
    const next = x % y;
    x = y;
    y = next;
  }
  return x || 1;
};

const parseFractionAmount = (amount: string): number | null => {
  const trimmed = amount.trim();
  if (!trimmed) {
    return 0;
  }

  const mixed = trimmed.match(/^(\d+)\s+(\d+)\/(\d+)$/);
  if (mixed) {
    const whole = Number(mixed[1]);
    const numerator = Number(mixed[2]);
    const denominator = Number(mixed[3]);
    return denominator ? whole + numerator / denominator : null;
  }

  const simple = trimmed.match(/^(\d+)\/(\d+)$/);
  if (simple) {
    const numerator = Number(simple[1]);
    const denominator = Number(simple[2]);
    return denominator ? numerator / denominator : null;
  }

  const numeric = Number(trimmed);
  return Number.isFinite(numeric) ? numeric : null;
};

const decimalToFraction = (value: number): string => {
  if (!Number.isFinite(value)) {
    return "0";
  }
  if (value === 0) {
    return "";
  }
  if (Number.isInteger(value)) {
    return value.toString();
  }

  const denominatorLimit = 64;
  const sign = value < 0 ? "-" : "";
  const absolute = Math.abs(value);
  const whole = Math.floor(absolute);
  const fraction = absolute - whole;
  let bestNumerator = 0;
  let bestDenominator = 1;
  let bestError = Number.POSITIVE_INFINITY;

  for (let denominator = 2; denominator <= denominatorLimit; denominator += 1) {
    const numerator = Math.round(fraction * denominator);
    const error = Math.abs(fraction - numerator / denominator);
    if (error < bestError) {
      bestNumerator = numerator;
      bestDenominator = denominator;
      bestError = error;
    }
  }

  if (bestNumerator === 0) {
    return `${sign}${whole}`;
  }

  if (bestNumerator === bestDenominator) {
    return `${sign}${whole + 1}`;
  }

  const divisor = gcd(bestNumerator, bestDenominator);
  const numerator = bestNumerator / divisor;
  const denominator = bestDenominator / divisor;

  if (whole > 0) {
    return `${sign}${whole} ${numerator}/${denominator}`;
  }
  return `${sign}${numerator}/${denominator}`;
};

export const normalizeAmountInput = (amount: string | number | undefined | null): {
  amount: number;
  amountText: string;
} => {
  const amountText = amount === undefined || amount === null ? "" : String(amount).trim();
  const parsed = parseFractionAmount(amountText);
  return {
    amount: parsed ?? 0,
    amountText,
  };
};

const parseRangeAmount = (amount: string): [number, number] | null => {
  const trimmed = amount.trim();
  const range = trimmed.match(/^(.+?)\s*[-–—]\s*(.+)$/);
  if (!range) {
    return null;
  }

  const start = parseFractionAmount(range[1]);
  const end = parseFractionAmount(range[2]);
  if (start === null || end === null) {
    return null;
  }
  return [start, end];
};

export const scaleAmount = (
  amount: string | number | undefined | null,
  scale: number,
  amountText?: string | null
): string => {
  const displayAmount = amountText?.trim() || (amount === undefined || amount === null ? "" : String(amount));
  const multiplier = Number(scale);
  const range = parseRangeAmount(displayAmount);
  if (range) {
    return `${decimalToFraction(range[0] * multiplier)}-${decimalToFraction(range[1] * multiplier)}`;
  }

  const value = parseFractionAmount(displayAmount);
  if (value === null) {
    return displayAmount;
  }
  return decimalToFraction(value * multiplier);
};

const singularMeasurements: Record<string, string> = {
  cups: "cup",
  cup: "cup",
  tablespoons: "tbsp",
  tablespoon: "tbsp",
  tbsp: "tbsp",
  teaspoons: "tsp",
  teaspoon: "tsp",
  tsp: "tsp",
};

const pluralMeasurements: Record<string, string> = {
  cup: "cups",
  cups: "cups",
  tablespoon: "tbsp",
  tablespoons: "tbsp",
  tbsp: "tbsp",
  teaspoon: "tsp",
  teaspoons: "tsp",
  tsp: "tsp",
};

const singularizeMeasurement = (measurement: string): string => {
  const trimmed = measurement.trim();
  const mapped = singularMeasurements[trimmed.toLowerCase()];
  if (mapped) {
    return mapped;
  }
  if (trimmed.toLowerCase().endsWith("s") && trimmed.length > 1) {
    return trimmed.slice(0, -1);
  }
  return trimmed;
};

const pluralizeMeasurement = (measurement: string): string => {
  const trimmed = measurement.trim();
  const mapped = pluralMeasurements[trimmed.toLowerCase()];
  if (mapped) {
    return mapped;
  }
  if (!trimmed || trimmed.toLowerCase().endsWith("s")) {
    return trimmed;
  }
  return `${trimmed}s`;
};

export const formatMeasurementForAmount = (
  amount: string | number | undefined | null,
  measurement: string | undefined | null
): string => {
  const trimmedMeasurement = measurement?.trim() || "";
  if (!trimmedMeasurement) {
    return "";
  }

  const parsed = parseFractionAmount(amount === undefined || amount === null ? "" : String(amount));
  if (parsed !== null && parsed <= 1) {
    return singularizeMeasurement(trimmedMeasurement);
  }
  return pluralizeMeasurement(trimmedMeasurement);
};

export const formatIngredientQuantity = (
  amount: string | number | undefined | null,
  measurement: string | undefined | null
): string => {
  const displayAmount = amount === undefined || amount === null ? "" : String(amount).trim();
  if (!displayAmount) {
    return "";
  }
  const displayMeasurement = formatMeasurementForAmount(displayAmount, measurement);
  return `${displayAmount} ${displayMeasurement}`.trim();
};
