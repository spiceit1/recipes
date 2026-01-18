import { useEffect, useMemo, useState } from "react";
import { Navigate, Route, Routes } from "react-router-dom";
import Home from "./pages/Home.jsx";
import RecipeDetail from "./pages/RecipeDetail.jsx";
import AdminDashboard from "./pages/AdminDashboard.jsx";
import AdminRecipeForm from "./pages/AdminRecipeForm.jsx";
import AdminIngredients from "./pages/AdminIngredients.jsx";
import AdminMeasurements from "./pages/AdminMeasurements.jsx";
import AdminComments from "./pages/AdminComments.jsx";
import SearchBar from "./components/SearchBar.jsx";
import AdminLayout from "./components/AdminLayout.jsx";
import { getAdminMode, setAdminMode } from "./lib/storage.js";

const App = () => {
  const [adminMode, setAdminModeState] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");

  useEffect(() => {
    setAdminModeState(getAdminMode());
  }, []);

  const handleAdminEnabled = () => {
    setAdminMode(true);
    setAdminModeState(true);
  };

  const adminLayoutValue = useMemo(
    () => ({ adminMode, onAdminEnabled: handleAdminEnabled }),
    [adminMode]
  );

  return (
    <div className="app-shell">
      <header className="site-header">
        <div className="site-title">Recipes</div>
        <SearchBar
          onAdminEnabled={handleAdminEnabled}
          onSearch={(value) => setSearchQuery(value)}
        />
        {adminMode ? (
          <nav className="admin-nav">
            <a href="/admin">Dashboard</a>
            <a href="/admin/recipes/new">Add Recipe</a>
            <a href="/admin/ingredients">Ingredients</a>
            <a href="/admin/measurements">Measurements</a>
            <a href="/admin/comments">Comments</a>
          </nav>
        ) : null}
      </header>
      <main className="page-wrapper">
        <Routes>
          <Route
            path="/"
            element={<Home adminMode={adminMode} searchQuery={searchQuery} />}
          />
          <Route
            path="/recipe/:id"
            element={<RecipeDetail adminMode={adminMode} />}
          />
          <Route
            path="/admin"
            element={
              adminMode ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminDashboard />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
          <Route
            path="/admin/recipes/new"
            element={
              adminMode ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminRecipeForm />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
          <Route
            path="/admin/recipes/:id"
            element={
              adminMode ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminRecipeForm />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
          <Route
            path="/admin/ingredients"
            element={
              adminMode ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminIngredients />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
          <Route
            path="/admin/measurements"
            element={
              adminMode ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminMeasurements />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
          <Route
            path="/admin/comments"
            element={
              adminMode ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminComments />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
        </Routes>
      </main>
    </div>
  );
};

export default App;
