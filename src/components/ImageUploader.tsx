import { type ChangeEvent, type ClipboardEvent, useState } from "react";
import { api } from "../lib/api";

type ImageUploaderProps = {
  label: string;
  value?: string | null;
  onChange: (value: string) => void;
};

const ImageUploader = ({ label, value, onChange }: ImageUploaderProps) => {
  const [isUploading, setIsUploading] = useState(false);
  const [showPreview, setShowPreview] = useState(false);

  const uploadDataUrl = async (dataUrl: string | ArrayBuffer | null, fileName = "clipboard.png") => {
    if (!dataUrl) {
      return;
    }
    setIsUploading(true);
    try {
      const response = await api.uploadImage({
        fileName,
        contentType: "image/png",
        dataUrl,
      });
      onChange(response?.url || "");
    } finally {
      setIsUploading(false);
    }
  };

  const handleFile = async (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (!file) {
      return;
    }
    setIsUploading(true);
    const reader = new FileReader();
    reader.onloadend = async () => {
      try {
        const response = await api.uploadImage({
          fileName: file.name,
          contentType: file.type,
          dataUrl: reader.result,
        });
        onChange(response?.url || "");
      } finally {
        setIsUploading(false);
      }
    };
    reader.readAsDataURL(file);
  };

  const handlePaste = async (event: ClipboardEvent<HTMLDivElement>) => {
    const items = event.clipboardData?.items || [];
    const imageItem = Array.from(items).find((item) => item.type.startsWith("image/"));
    if (imageItem) {
      const file = imageItem.getAsFile();
      if (!file) {
        return;
      }
      const reader = new FileReader();
      reader.onloadend = async () => {
        await uploadDataUrl(reader.result, file.name || "clipboard.png");
      };
      reader.readAsDataURL(file);
      return;
    }
    const text = event.clipboardData?.getData("text");
    if (text && text.startsWith("http")) {
      onChange(text);
    }
  };

  return (
    <div className="image-uploader">
      <label className="field-label">{label}</label>
      <div className="inline-row">
        <input
          type="text"
          value={value || ""}
          onChange={(event) => onChange(event.target.value)}
        />
        <button
          type="button"
          className="ghost-button"
          disabled={!value}
          onClick={() => setShowPreview(true)}
        >
          👁
        </button>
      </div>
      <div
        className="paste-zone"
        onPaste={handlePaste}
        contentEditable
        suppressContentEditableWarning
      >
        Paste image here
      </div>
      <input type="file" accept="image/*" onChange={handleFile} />
      {isUploading ? <div className="tiny-text">Uploading...</div> : null}
      {showPreview && value ? (
        <div
          className="modal-backdrop"
          role="presentation"
          onClick={() => setShowPreview(false)}
        >
          <div
            className="modal modal-wide"
            role="dialog"
            aria-modal="true"
            onClick={(event) => event.stopPropagation()}
          >
            <div className="modal-header">
              <h3>Image Preview</h3>
              <button
                type="button"
                className="modal-close"
                onClick={() => setShowPreview(false)}
              >
                ✕
              </button>
            </div>
            <div className="image-preview">
              <img src={value} alt="Preview" />
            </div>
          </div>
        </div>
      ) : null}
    </div>
  );
};

export default ImageUploader;
