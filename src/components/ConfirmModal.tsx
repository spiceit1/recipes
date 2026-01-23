type ConfirmModalProps = {
  title: string;
  message: string;
  confirmLabel?: string;
  onCancel: () => void;
  onConfirm: () => void;
};

const ConfirmModal = ({
  title,
  message,
  confirmLabel,
  onCancel,
  onConfirm,
}: ConfirmModalProps) => {
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
          <button type="button" className="admin-action danger" onClick={onConfirm}>
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                fill="currentColor"
                d="M6 7h12l-1 14H7L6 7Zm3-3h6l1 2H8l1-2Zm-2 2h10v2H7V6Z"
              />
            </svg>
            {confirmLabel || "Delete"}
          </button>
          <button type="button" className="admin-action secondary" onClick={onCancel}>
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                fill="currentColor"
                d="m18.3 5.71-1.41-1.42L12 9.17 7.11 4.29 5.7 5.71 10.59 10.6 5.7 15.49l1.41 1.41L12 12.01l4.89 4.89 1.41-1.41-4.89-4.89 4.89-4.89Z"
              />
            </svg>
            Cancel
          </button>
        </div>
      </div>
    </div>
  );
};

export default ConfirmModal;
