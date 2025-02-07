import React from 'react';

const Header = ({
  score,
  timeLimit,
  timeRemaining,
  speed,
  radius,
  handleSpeedChange,
  handleRadiusChange,
  handleTimeLimitChange,
}) => {
  const safeToFixed = (value, decimals) => {
    return typeof value === 'number' && !isNaN(value)
      ? value.toFixed(decimals)
      : '0.00'; // Return a default value if not a valid number
  };

  return (
    <div className="header">
      <h1>Time-Space Ball</h1>
      <div>Score: {score}</div>
      <div>Time Remaining: {timeRemaining}s</div>
      <div>Speed: {safeToFixed(speed, 2)}</div>
      <div>Radius: {safeToFixed(radius, 2)}</div>
      <div>
        <label htmlFor="timeLimit">Time Limit: </label>
        <input
          type="number"
          id="timeLimit"
          value={timeLimit}
          onChange={handleTimeLimitChange}
          min="1"
          max="60"
        />
      </div>
      <div>
        <label>Speed:</label>
        <input
          type="range"
          min="0.1"
          max="10.0"
          step="0.1"
          value={speed}
          onChange={handleSpeedChange}
        />
      </div>
      <div>
        <label>Radius:</label>
        <input
          type="range"
          min="1"
          max="3"
          step="0.1"
          value={radius}
          onChange={handleRadiusChange}
        />
      </div>
    </div>
  );
};

export default Header;
