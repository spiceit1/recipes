import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import ConfirmModal from "../components/ConfirmModal.jsx";
import EmptyState from "../components/EmptyState.jsx";

const AdminComments = () => {
  const [comments, setComments] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [pendingDelete, setPendingDelete] = useState(null);

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
    setPendingDelete(id);
  };

  const confirmDelete = async () => {
    if (!pendingDelete) {
      return;
    }
    await api.deleteComment(pendingDelete);
    setPendingDelete(null);
    load();
  };

  if (isLoading) {
    return <div className="empty-state">Loading...</div>;
  }

  if (!comments.length) {
    return <EmptyState message="No comments yet" />;
  }

  return (
    <>
      <div className="admin-page">
        <h1>Comments</h1>
        <div className="admin-list">
          {comments.map((comment) => (
            <div key={comment.id} className="admin-card">
              <div>
                <div className="admin-title">{comment.recipe?.name || "Recipe"}</div>
                <div className="tiny-text">
                  {comment.name} · {comment.email} · {comment.rating}/5 ·{" "}
                  {comment.createdAt
                    ? new Date(comment.createdAt).toLocaleDateString()
                    : ""}
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
      {pendingDelete ? (
        <ConfirmModal
          title="Delete comment?"
          message="This will remove the comment permanently."
          confirmLabel="Delete"
          onCancel={() => setPendingDelete(null)}
          onConfirm={confirmDelete}
        />
      ) : null}
    </>
  );
};

export default AdminComments;
