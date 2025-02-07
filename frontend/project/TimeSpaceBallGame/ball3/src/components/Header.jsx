import React from 'react';
import { Link } from 'react-router-dom';

function Header({
  mode,
  score1,
  score2,
  timeLimit,
  timeRemaining,
  speed,
  radius,
  handleSpeedChange,
  handleRadiusChange,
  handleTimeLimitChange,
  isGameRunning,
  handleStartGame,
  handleStopGame,
  handlePauseGame,
  isPaused,
}) {
  return (
    <div className="header-overlay">
      <h2>{mode === 'single' ? 'Single Player' : 'Multiplayer'}</h2>
      <div>
        {mode === 'single' ? (
          <div className="score-panel">Score: {score1}</div>
        ) : null}
      </div>
      <div>
        {mode === 'multiplayer' ? (
          <>
            <div className="score-panel">Score1: {score1}</div>
            <div className="score-panel">Score2: {score2}</div>
          </>
        ) : null}
      </div>
      <div className="controls">
        <button onClick={handleStartGame} disabled={isGameRunning}>
          Start
        </button>
        <button onClick={handleStopGame} disabled={!isGameRunning}>
          Stop
        </button>
        <button onClick={handlePauseGame} disabled={!isGameRunning}>
          {isPaused ? 'Resume' : 'Pause'}
        </button>
        <Link to="/mode-selection">
          <button disabled={isGameRunning}>Back to Mode Selection</button>
        </Link>
      </div>
      <div className="settings">
        <div>
          Speed:
          <input
            type="range"
            min="0.01"
            max="0.2"
            step="0.01"
            value={speed}
            onChange={handleSpeedChange}
            disabled={isGameRunning}
          />
          {speed}
        </div>
        <div>
          Radius:
          <input
            type="range"
            min="0.5"
            max="5"
            step="0.1"
            value={radius}
            onChange={handleRadiusChange}
            disabled={isGameRunning}
          />
          {radius}
        </div>
        <div>
          Time Limit:
          <input
            type="number"
            min="10"
            max="300"
            value={timeLimit}
            onChange={handleTimeLimitChange}
            disabled={isGameRunning}
          />
        </div>
      </div>
      <div className="timer">Time Left: {timeRemaining}s</div>
    </div>
  );
}

export default Header;
