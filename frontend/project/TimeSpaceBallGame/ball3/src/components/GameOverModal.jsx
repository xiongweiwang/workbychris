import React from 'react';

function GameOverModal({ score, onRestart }) {
  return (
    <div className="game-over-modal">
      <h2>Game Over</h2>
      <p>Your Score: {score}</p>
      <button onClick={onRestart}>Restart</button>
    </div>
  );
}

export default GameOverModal;
