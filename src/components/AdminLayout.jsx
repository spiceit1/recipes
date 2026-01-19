import { NavLink } from "react-router-dom";

const AdminLayout = ({ children }) => (
  <section className="admin-layout">
    <div className="admin-top">
      <div className="admin-header">
        <h1>Admin</h1>
      </div>
      <nav className="admin-nav">
        <NavLink to="/admin" end>
          Recipes
        </NavLink>
        <NavLink to="/admin/ingredients">Ingredients</NavLink>
        <NavLink to="/admin/measurements">Measurements</NavLink>
        <NavLink to="/admin/comments">Comments</NavLink>
      </nav>
    </div>
    {children}
  </section>
);

export default AdminLayout;
