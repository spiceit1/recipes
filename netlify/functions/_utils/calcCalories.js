export const calculateCalories = (items) => {
  return items.reduce((total, item) => {
    const amount = Number(item.amount || 0);
    const conversionFactor = Number(item.measurement?.conversionFactor || 1);
    const caloriesPerUnit = Number(item.ingredient?.caloriesPerUnit || 0);
    return total + amount * conversionFactor * caloriesPerUnit;
  }, 0);
};
