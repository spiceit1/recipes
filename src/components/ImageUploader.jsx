import { useState } from "react";
import { api } from "../lib/api.js";

const ImageUploader = ({ label, value, onChange }) => {
  const [isUploading, setIsUploading] = useState(false);

  const handleFile = async (event) => {
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

  return (
    <div className="image-uploader">
      <label className="field-label">{label}</label>
      <input
        type="text"
        value={value || ""}
        onChange={(event) => onChange(event.target.value)}
      />
      <input type="file" accept="image/*" onChange={handleFile} />
      {isUploading ? <div className="tiny-text">Uploading...</div> : null}
    </div>
  );
};

export default ImageUploader;
