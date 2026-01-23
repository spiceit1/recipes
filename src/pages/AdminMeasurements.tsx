import { useEffect, useState } from "react";
import { toast } from "react-hot-toast";
import { api } from "../lib/api";
import ConfirmModal from "../components/ConfirmModal";
import EmptyState from "../components/EmptyState";
import type { Measurement } from "../lib/types";

const AdminMeasurements = () => {
  const [measurements, setMeasurements] = useState<Measurement[]>([]);
  const [name, setName] = useState("");
  const [editingId, setEditingId] = useState("");
  const [editingName, setEditingName] = useState("");
  const [pendingDelete, setPendingDelete] = useState<{ id: string; name: string } | null>(
    null
  );

  const load = async () => {
    const data = await api.getMeasurements();
    setMeasurements(data || []);
  };

  useEffect(() => {
    load();
  }, []);

  const handleCreate = async () => {
    const trimmed = name.trim();
    if (!trimmed) {
      return;
    }
    try {
      await api.createMeasurement({
        name: trimmed,
        conversionFactor: 0,
      });
      setName("");
      toast.success("Measurement added.");
      load();
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        toast.error("Measurement already exists.");
        return;
      }
      toast.error("Unable to add measurement.");
    }
  };

  const handleUpdate = async (id: string, field: "name", value: string) => {
    const current = measurements.find((item) => item.id === id);
    if (!current) {
      return;
    }
    await api.updateMeasurement(id, {
      name: field === "name" ? value : current.name,
    });
    load();
  };
  const handleEdit = (item: Measurement) => {
    setEditingId(item.id);
    setEditingName(item.name);
  };

  const handleSaveEdit = async () => {
    if (!editingId) {
      return;
    }
    const trimmed = editingName.trim();
    if (!trimmed) {
      return;
    }
    try {
      await handleUpdate(editingId, "name", trimmed);
      setEditingId("");
      setEditingName("");
      toast.success("Measurement updated.");
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        toast.error("Measurement already exists.");
        return;
      }
      toast.error("Unable to update measurement.");
    }
  };

  const handleCancelEdit = () => {
    setEditingId("");
    setEditingName("");
  };


  const handleDelete = async (item: Measurement) => {
    setPendingDelete({ id: item.id, name: item.name });
  };

  const confirmDelete = async () => {
    if (!pendingDelete?.id) {
      return;
    }
    await api.deleteMeasurement(pendingDelete.id);
    setPendingDelete(null);
    toast.success("Measurement deleted.");
    load();
  };

  return (
    <div className="admin-page">
      <h1>Measurements</h1>
      <div className="admin-form">
        <div className="inline-row">
          <input
            type="text"
            value={name}
            onChange={(event) => setName(event.target.value)}
          />
          <button type="button" className="admin-action success" onClick={handleCreate}>
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                fill="currentColor"
                d="M11 5h2v6h6v2h-6v6h-2v-6H5v-2h6V5Z"
              />
            </svg>
            Add
          </button>
        </div>
      </div>
      {!measurements.length ? (
        <EmptyState message="No measurements yet" />
      ) : (
        <div className="admin-list">
          {measurements.map((item) => (
            <div key={item.id} className="admin-card">
              {editingId === item.id ? (
                <div className="inline-row">
                  <input
                    type="text"
                    value={editingName}
                    onChange={(event) => setEditingName(event.target.value)}
                  />
                  <button type="button" className="admin-action primary" onClick={handleSaveEdit}>
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                      <path
                        fill="currentColor"
                        d="M17 3H5a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V7l-4-4Zm-5 16a3 3 0 1 1 0-6 3 3 0 0 1 0 6Zm3-10H5V5h10v4Z"
                      />
                    </svg>
                    Save
                  </button>
                  <button
                    type="button"
                    className="admin-action secondary"
                    onClick={handleCancelEdit}
                  >
                    <svg viewBox="0 0 24 24" aria-hidden="true">
                      <path
                        fill="currentColor"
                        d="m18.3 5.71-1.41-1.42L12 9.17 7.11 4.29 5.7 5.71 10.59 10.6 5.7 15.49l1.41 1.41L12 12.01l4.89 4.89 1.41-1.41-4.89-4.89 4.89-4.89Z"
                      />
                    </svg>
                    Cancel
                  </button>
                </div>
              ) : (
                <>
                  <div className="admin-text">{item.name}</div>
                  <div className="inline-row">
                    <button
                      type="button"
                      className="admin-action primary"
                      onClick={() => handleEdit(item)}
                    >
                      <svg viewBox="0 0 24 24" aria-hidden="true">
                        <path
                          fill="currentColor"
                          d="M3 17.25V21h3.75L19.81 7.94l-3.75-3.75L3 17.25Zm17.71-10.04a1.003 1.003 0 0 0 0-1.42l-2.5-2.5a1.003 1.003 0 0 0-1.42 0l-1.83 1.83 3.75 3.75 2-1.66Z"
                        />
                      </svg>
                      Edit
                    </button>
                    <button
                      type="button"
                      className="admin-action danger"
                      onClick={() => handleDelete(item)}
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
                </>
              )}
            </div>
          ))}
        </div>
      )}
      {pendingDelete ? (
        <ConfirmModal
          title={`Delete "${pendingDelete.name}"?`}
          message="This will remove the measurement permanently."
          confirmLabel="Delete"
          onCancel={() => setPendingDelete(null)}
          onConfirm={confirmDelete}
        />
      ) : null}
    </div>
  );
};

export default AdminMeasurements;
