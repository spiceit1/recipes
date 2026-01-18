import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import EmptyState from "../components/EmptyState.jsx";

const AdminComments = () => {
  const [comments, setComments] = useState([]);
  const [isLoading, setIsLoading] = useState(true);

  const load = async () => {
    setIsLoading(true);
    try {
      const data = await api.getComments();
      setComments(data || []);
    } finally {
      setIsLoading(false);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const handleDelete = async (id) => {
    await api.deleteComment(id);
    load();
  };

  if (isLoading) {
    return <div className="empty-state">Loading...</div>;
  }

  if (!comments.length) {
    return <EmptyState message="No comments yet" />;
  }

  return (
    <div className="admin-page">
      <h1>Comments</h1>
      <div className="admin-list">
        {comments.map((comment) => (
          <div key={comment.id} className="admin-card">
            <div>
              <div className="admin-title">{comment.recipe?.name || "Recipe"}</div>
              <div className="tiny-text">
                {comment.name} · {comment.rating}/5
              </div>
              <div>{comment.comment}</div>
            </div>
            <button type="button" onClick={() => handleDelete(comment.id)}>
              Delete
            </button>
          </div>
        ))}
      </div>
    </div>
  );
};

export default AdminComments;
