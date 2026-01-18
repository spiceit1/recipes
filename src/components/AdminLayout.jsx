import { Link } from "react-router-dom";

const AdminLayout = ({ children }) => (
  <section className="admin-layout">
    <div className="admin-top">
      <div className="admin-header">
        <h1>Admin</h1>
      </div>
      <nav className="admin-nav">
        <Link to="/admin">Recipes</Link>
        <Link to="/admin/ingredients">Ingredients</Link>
        <Link to="/admin/measurements">Measurements</Link>
        <Link to="/admin/comments">Comments</Link>
      </nav>
    </div>
    {children}
  </section>
);

export default AdminLayout;
