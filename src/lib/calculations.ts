export const formatTime = (minutes: number): string => {
  if (!Number.isFinite(minutes)) {
    return "0";
  }
  return `${minutes}`;
};

export const getTotalTime = (prepTime: number | null, cookTime: number | null): number =>
  Number(prepTime || 0) + Number(cookTime || 0);

export const scaleAmount = (amount: number | undefined, scale: number): string => {
  const value = Number(amount) * Number(scale);
  if (!Number.isFinite(value)) {
    return "0";
  }
  return Number.isInteger(value) ? value.toString() : value.toFixed(2);
};
