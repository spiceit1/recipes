export const formatTime = (minutes) => {
  if (!Number.isFinite(minutes)) {
    return "0";
  }
  return `${minutes}`;
};

export const getTotalTime = (prepTime, cookTime) =>
  Number(prepTime || 0) + Number(cookTime || 0);

export const scaleAmount = (amount, scale) => {
  const value = Number(amount) * Number(scale);
  if (!Number.isFinite(value)) {
    return "0";
  }
  return Number.isInteger(value) ? value.toString() : value.toFixed(2);
};
