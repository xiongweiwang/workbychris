import React, { useState } from 'react';
import TimeSpaceBallGame from './TimeSpaceBallGame';

function MultiPlayerGame({ onMainMenu, onBack }) {
  const [player1, setPlayer1] = useState({ name: 'Player 1', score: 0 });
  const [player2, setPlayer2] = useState({ name: 'Player 2', score: 0 });

  const handleScoreUpdate = (player, points) => {
    if (player === 'player1') {
      setPlayer1((prev) => ({ ...prev, score: prev.score + points }));
    } else if (player === 'player2') {
      setPlayer2((prev) => ({ ...prev, score: prev.score + points }));
    }
  };

  return (
    <div>
      <button onClick={onMainMenu}>Main Menu</button>
      <button onClick={onBack}>Back</button>
      <div className="multiplayer-info">
        <div>
          <label>
            Name 1:
            <input
              type="text"
              value={player1.name}
              onChange={(e) => setPlayer1({ ...player1, name: e.target.value })}
            />
          </label>
          <p>Score: {player1.score}</p>
        </div>
        <div>
          <label>
            Name 2:
            <input
              type="text"
              value={player2.name}
              onChange={(e) => setPlayer2({ ...player2, name: e.target.value })}
            />
          </label>
          <p>Score: {player2.score}</p>
        </div>
      </div>
      <TimeSpaceBallGame
        onPlayerClick={(player) => handleScoreUpdate(player, 10)}
      />
    </div>
  );
}

export default MultiPlayerGame;
