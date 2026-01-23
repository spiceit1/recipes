import { useEffect, useMemo, useState } from "react";
import {
  Link,
  Navigate,
  Route,
  Routes,
  useLocation,
  useNavigate,
  useSearchParams,
} from "react-router-dom";
import Home from "./pages/Home";
import RecipeDetail from "./pages/RecipeDetail";
import AdminRecipes from "./pages/AdminRecipes";
import AdminIngredients from "./pages/AdminIngredients";
import AdminMeasurements from "./pages/AdminMeasurements";
import AdminComments from "./pages/AdminComments";
import SearchBar from "./components/SearchBar";
import AdminLayout from "./components/AdminLayout";
import { getAdminMode, setAdminMode } from "./lib/storage";

type AdminLayoutValue = {
  adminMode: boolean;
  onAdminEnabled: () => void;
};

const App = () => {
  const [adminMode, setAdminModeState] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [adminView, setAdminView] = useState(false);
  const navigate = useNavigate();
  const location = useLocation();
  const [searchParams, setSearchParams] = useSearchParams();

  useEffect(() => {
    const enabled = getAdminMode();
    setAdminModeState(enabled);
    setAdminView(enabled);
  }, []);

  const handleAdminEnabled = () => {
    setAdminMode(true);
    setAdminModeState(true);
    setAdminView(true);
  };

  const handleAdminExit = () => {
    setAdminMode(false);
    setAdminModeState(false);
    setAdminView(false);
    navigate("/");
  };

  const handleToggleView = () => {
    setAdminView((prev) => !prev);
  };

  useEffect(() => {
    if (!adminMode) {
      return;
    }
    const isAdminRoute = location.pathname.startsWith("/admin");
    if (adminView && !isAdminRoute) {
      navigate("/admin");
    }
    if (!adminView && isAdminRoute) {
      navigate("/");
    }
  }, [adminMode, adminView, location.pathname, navigate]);

  useEffect(() => {
    if (!adminMode) {
      return;
    }
    if (searchParams.get("customerView") === "1") {
      setAdminView(false);
      setSearchParams((params) => {
        params.delete("customerView");
        return params;
      });
    }
  }, [adminMode, searchParams, setSearchParams]);

  const adminLayoutValue = useMemo<AdminLayoutValue>(
    () => ({ adminMode, onAdminEnabled: handleAdminEnabled }),
    [adminMode]
  );

  return (
    <div className="app-shell">
      <header className="site-header">
        <Link className="site-title" to="/">
          <img src="/alex-logo.jpg" alt="Alex's Recipes" />
        </Link>
        <SearchBar
          onAdminEnabled={handleAdminEnabled}
          onSearch={(value) => setSearchQuery(value)}
        />
        {adminMode ? (
          <div className="admin-entry">
            <button type="button" className="admin-toggle" onClick={handleToggleView}>
              {adminView ? "Customer View" : "Admin View"}
            </button>
            <button
              type="button"
              className="admin-button dark"
              onClick={handleAdminExit}
            >
              Exit Admin
            </button>
          </div>
        ) : null}
      </header>
      <main className="page-wrapper">
        <Routes>
          <Route path="/" element={<Home searchQuery={searchQuery} />} />
          <Route
            path="/recipe/:id"
            element={<RecipeDetail adminMode={adminView} />}
          />
          <Route
            path="/admin"
            element={
              adminMode && adminView ? (
                <AdminLayout value={adminLayoutValue}>
                  <AdminRecipes />
                </AdminLayout>
              ) : (
                <Navigate to="/" />
              )
            }
          />
          <Route
            path="/admin/recipes/new"
            element={<Navigate to="/admin" />}
          />
          <Route
            path="/admin/recipes/:id"
            element={<Navigate to="/admin" />}
          />
          <Route
            path="/admin/ingredients"
            element={
              adminMode && adminView ? (
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
              adminMode && adminView ? (
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
              adminMode && adminView ? (
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
