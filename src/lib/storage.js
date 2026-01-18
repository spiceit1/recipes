const ADMIN_KEY = "adminMode";

export const getAdminMode = () => {
  if (typeof window === "undefined") {
    return false;
  }
  return window.localStorage.getItem(ADMIN_KEY) === "true";
};

export const setAdminMode = (value) => {
  if (typeof window === "undefined") {
    return;
  }
  window.localStorage.setItem(ADMIN_KEY, value ? "true" : "false");
};
