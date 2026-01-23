import { useEffect, useState } from "react";
import { api } from "../lib/api";
import ConfirmModal from "../components/ConfirmModal";
import EmptyState from "../components/EmptyState";
import type { Comment } from "../lib/types";

const AdminComments = () => {
  const [comments, setComments] = useState<Comment[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [pendingDelete, setPendingDelete] = useState<string | null>(null);

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

  const handleDelete = async (id: string) => {
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
              <button
                type="button"
                className="admin-action danger"
                onClick={() => handleDelete(comment.id)}
              >
                <svg viewBox="0 0 24 24" aria-hidden="true">
                  <path
                    fill="currentColor"
                    d="M6 7h12l-1 14H7L6 7Zm3-3h6l1 2H8l1-2Zm-2 2h10v2H7V6Z"
                  />
                </svg>
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
