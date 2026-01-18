import { useEffect, useState } from "react";
import { ADMIN_TOKEN } from "../lib/constants.js";

const SearchBar = ({ onAdminEnabled, onSearch }) => {
  const [value, setValue] = useState("");

  useEffect(() => {
    if (value === ADMIN_TOKEN) {
      onAdminEnabled?.();
      setValue("");
      onSearch?.("");
    }
  }, [value, onAdminEnabled, onSearch]);

  const handleSubmit = (event) => {
    event.preventDefault();
    onSearch?.(value.trim());
  };

  return (
    <form className="search-bar" onSubmit={handleSubmit}>
      <label className="sr-only" htmlFor="search-input">
        Search
      </label>
      <input
        id="search-input"
        type="search"
        value={value}
        onChange={(event) => {
          setValue(event.target.value);
          onSearch?.(event.target.value);
        }}
      />
      <button type="submit">Search</button>
    </form>
  );
};

export default SearchBar;
