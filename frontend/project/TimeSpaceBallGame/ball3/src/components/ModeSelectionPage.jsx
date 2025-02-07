import React from 'react';
import { Link } from 'react-router-dom';

const ModeSelectionPage = ({ onSelectMode }) => {
  return (
    <div className="mode-selection">
      <h2>Select Game Mode</h2>
      <button
        onClick={() => {
          onSelectMode('single');
        }}
      >
        <Link to="/game">Single Player</Link>
      </button>
      <button
        onClick={() => {
          onSelectMode('multiplayer');
        }}
      >
        <Link to="/game">Multiplayer</Link>
      </button>
      <Link to="/">
        <button>Back to Main Page</button>
      </Link>
    </div>
  );
};

export default ModeSelectionPage;
