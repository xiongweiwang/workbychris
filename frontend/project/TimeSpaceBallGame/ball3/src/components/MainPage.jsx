import React from 'react';
import { Link } from 'react-router-dom';

const MainPage = () => {
  return (
    <div className="main-page">
      <h1>Welcome to Time-Space Ball Game</h1>
      <Link to="/mode-selection">
        <button>Enter Game</button>
      </Link>
    </div>
  );
};

export default MainPage;
