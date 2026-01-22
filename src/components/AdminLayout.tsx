import { type PropsWithChildren } from "react";
import { NavLink } from "react-router-dom";

type AdminLayoutProps = PropsWithChildren<{
  value?: {
    adminMode: boolean;
    onAdminEnabled: () => void;
  };
}>;

const AdminLayout = ({ children }: AdminLayoutProps) => (
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
