import { useEffect, useState } from "react";
import { api } from "../lib/api.js";
import EmptyState from "../components/EmptyState.jsx";

const AdminMeasurements = () => {
  const [measurements, setMeasurements] = useState([]);
  const [form, setForm] = useState({ name: "", conversionFactor: "" });

  const load = async () => {
    const data = await api.getMeasurements();
    setMeasurements(data || []);
  };

  useEffect(() => {
    load();
  }, []);

  const handleCreate = async () => {
    if (!form.name) {
      return;
    }
    await api.createMeasurement({
      name: form.name,
      conversionFactor: Number(form.conversionFactor || 0),
    });
    setForm({ name: "", conversionFactor: "" });
    load();
  };

  const handleUpdate = async (id, field, value) => {
    const current = measurements.find((item) => item.id === id);
    if (!current) {
      return;
    }
    await api.updateMeasurement(id, {
      name: field === "name" ? value : current.name,
      conversionFactor:
        field === "conversionFactor"
          ? Number(value || 0)
          : current.conversionFactor,
    });
    load();
  };

  const handleDelete = async (id) => {
    await api.deleteMeasurement(id);
    load();
  };

  return (
    <div className="admin-page">
      <h1>Measurements</h1>
      <div className="admin-form">
        <div className="inline-row">
          <input
            type="text"
            value={form.name}
            onChange={(event) =>
              setForm((prev) => ({ ...prev, name: event.target.value }))
            }
          />
          <input
            type="number"
            value={form.conversionFactor}
            onChange={(event) =>
              setForm((prev) => ({
                ...prev,
                conversionFactor: event.target.value,
              }))
            }
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
              <input
                type="text"
                value={item.name}
                onChange={(event) =>
                  setMeasurements((prev) =>
                    prev.map((measurement) =>
                      measurement.id === item.id
                        ? { ...measurement, name: event.target.value }
                        : measurement
                    )
                  )
                }
                onBlur={(event) => handleUpdate(item.id, "name", event.target.value)}
              />
              <input
                type="number"
                value={item.conversionFactor}
                onChange={(event) =>
                  setMeasurements((prev) =>
                    prev.map((measurement) =>
                      measurement.id === item.id
                        ? { ...measurement, conversionFactor: event.target.value }
                        : measurement
                    )
                  )
                }
                onBlur={(event) =>
                  handleUpdate(item.id, "conversionFactor", event.target.value)
                }
              />
              <button type="button" onClick={() => handleDelete(item.id)}>
                Delete
              </button>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default AdminMeasurements;
