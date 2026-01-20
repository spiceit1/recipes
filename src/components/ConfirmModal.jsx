const ConfirmModal = ({ title, message, confirmLabel, onCancel, onConfirm }) => {
  return (
    <div className="modal-backdrop" role="presentation">
      <div className="modal" role="dialog" aria-modal="true">
        <div className="modal-header">
          <h3>{title}</h3>
          <button type="button" className="modal-close" onClick={onCancel}>
            ✕
          </button>
        </div>
        <div>{message}</div>
        <div className="inline-row">
          <button type="button" className="admin-button" onClick={onConfirm}>
            {confirmLabel || "Delete"}
          </button>
          <button type="button" onClick={onCancel}>
            Cancel
          </button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmModal;
