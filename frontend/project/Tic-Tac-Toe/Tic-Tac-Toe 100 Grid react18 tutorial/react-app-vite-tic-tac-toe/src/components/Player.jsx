import { useState } from 'react';

export default function Player({ initialName, symbol, isActive }) {
  const [playName, setPlayName] = useState(initialName);
  const [isEditing, setIsEditing] = useState(false);

  function handleEditClick() {
    setIsEditing((editing) => !editing);
  }

  function handleChange(event) {
    setPlayName(event.target.value);
  }

  return (
    <li className={isActive ? 'active' : undefined}>
      <span className="player">
        {!isEditing && <span className="player-name">{playName}</span>}
        {isEditing && (
          <input
            type="text"
            required
            value={playName}
            onChange={handleChange}
          />
        )}
        <span className="player-symbol">{symbol}</span>
        <button onClick={handleEditClick}>{isEditing ? 'Save' : 'Edit'}</button>
      </span>
    </li>
  );
}
