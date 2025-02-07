import React from 'react';

function Header({
  score,
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
      <div className="score-panel">Score: {score}</div>
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
