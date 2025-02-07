import React from 'react';
import TimeSpaceBallGame from './TimeSpaceBallGame';

function SinglePlayerGame({ onMainMenu, onBack }) {
  return (
    <div>
      <button onClick={onMainMenu}>Main Menu</button>
      <button onClick={onBack}>Back</button>
      <TimeSpaceBallGame />
    </div>
  );
}

export default SinglePlayerGame;
