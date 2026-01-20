import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import ConfirmModal from "../components/ConfirmModal.jsx";
import EmptyState from "../components/EmptyState.jsx";

const AdminMeasurements = () => {
  const [measurements, setMeasurements] = useState([]);
  const [name, setName] = useState("");
  const [message, setMessage] = useState("");
  const [editingId, setEditingId] = useState("");
  const [editingName, setEditingName] = useState("");
  const [pendingDelete, setPendingDelete] = useState(null);

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
    setMessage("");
    try {
      await api.createMeasurement({
        name: trimmed,
        conversionFactor: 0,
      });
      setName("");
      load();
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        setMessage("Already exists");
        return;
      }
      setMessage("Unable to add measurement");
    }
  };

  const handleUpdate = async (id, field, value) => {
    const current = measurements.find((item) => item.id === id);
    if (!current) {
      return;
    }
    await api.updateMeasurement(id, {
      name: field === "name" ? value : current.name,
    });
    load();
  };
  const handleEdit = (item) => {
    setEditingId(item.id);
    setEditingName(item.name);
    setMessage("");
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
    } catch (error) {
      if (error.message?.toLowerCase().includes("already exists")) {
        setMessage("Already exists");
        return;
      }
      setMessage("Unable to update measurement");
    }
  };

  const handleCancelEdit = () => {
    setEditingId("");
    setEditingName("");
  };


  const handleDelete = async (item) => {
    setPendingDelete({ id: item.id, name: item.name });
  };

  const confirmDelete = async () => {
    if (!pendingDelete?.id) {
      return;
    }
    await api.deleteMeasurement(pendingDelete.id);
    setPendingDelete(null);
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
        {message ? <div className="inline-message">{message}</div> : null}
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
