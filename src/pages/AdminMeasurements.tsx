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
          <button type="button" onClick={handleCreate}>
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
                  <button type="button" onClick={handleSaveEdit}>
                    Save
                  </button>
                  <button type="button" onClick={handleCancelEdit}>
                    Cancel
                  </button>
                </div>
              ) : (
                <>
                  <div className="admin-text">{item.name}</div>
                  <div className="inline-row">
                    <button type="button" onClick={() => handleEdit(item)}>
                      Edit
                    </button>
                    <button type="button" onClick={() => handleDelete(item)}>
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
