import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import MainPage from './components/MainPage';
import ModeSelectionPage from './components/ModeSelectionPage';
import TimeSpaceBallGame from './components/TimeSpaceBallGame';
import './App.css';

export default function App() {
  const [gameMode, setGameMode] = useState(null); // 游戏模式

  const selectMode = (mode) => {
    console.log('Mode selected:', mode); // 调试信息
    setGameMode(mode);
  };

  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<MainPage />} />
          <Route
            path="/mode-selection"
            element={<ModeSelectionPage onSelectMode={selectMode} />}
          />
          <Route path="/game" element={<TimeSpaceBallGame mode={gameMode} />} />
        </Routes>
      </div>
    </Router>
  );
}
