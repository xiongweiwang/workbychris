import React, { useState } from 'react';
import './App.css';

const gridSize = 10;
const winCondition = 5;

const App = () => {
  const [board, setBoard] = useState(Array(gridSize * gridSize).fill(''));
  const [currentPlayer, setCurrentPlayer] = useState('X');
  const [status, setStatus] = useState(`Player X's turn`);
  const [gameActive, setGameActive] = useState(true);

  const handleClick = (index) => {
    if (board[index] !== '' || !gameActive) return;

    const newBoard = [...board];
    newBoard[index] = currentPlayer;
    setBoard(newBoard);

    if (checkWin(newBoard, index)) {
      setStatus(`Player ${currentPlayer} wins!`);
      setGameActive(false);
    } else if (newBoard.every((cell) => cell !== '')) {
      setStatus("It's a draw!");
      setGameActive(false);
    } else {
      const nextPlayer = currentPlayer === 'X' ? 'O' : 'X';
      setCurrentPlayer(nextPlayer);
      setStatus(`Player ${nextPlayer}'s turn`);
    }
  };

  const checkWin = (board, index) => {
    const row = Math.floor(index / gridSize);
    const col = index % gridSize;
    return (
      checkDirection(board, row, col, 1, 0) || // Horizontal
      checkDirection(board, row, col, 0, 1) || // Vertical
      checkDirection(board, row, col, 1, 1) || // Diagonal down-right
      checkDirection(board, row, col, 1, -1) // Diagonal down-left
    );
  };

  const checkDirection = (board, row, col, rowInc, colInc) => {
    let count = 1;
    count += countConsecutive(board, row, col, rowInc, colInc);
    count += countConsecutive(board, row, col, -rowInc, -colInc);
    return count >= winCondition;
  };

  const countConsecutive = (board, row, col, rowInc, colInc) => {
    let consecutive = 0;
    let r = row + rowInc;
    let c = col + colInc;

    while (
      r >= 0 &&
      r < gridSize &&
      c >= 0 &&
      c < gridSize &&
      board[r * gridSize + c] === currentPlayer
    ) {
      consecutive++;
      r += rowInc;
      c += colInc;
    }
    return consecutive;
  };

  const restartGame = () => {
    setBoard(Array(gridSize * gridSize).fill(''));
    setCurrentPlayer('X');
    setStatus("Player X's turn");
    setGameActive(true);
  };

  return (
    <div className="game">
      <h1>10x10 Tic-Tac-Toe</h1>
      <div className="board">
        {board.map((cell, index) => (
          <div key={index} className="cell" onClick={() => handleClick(index)}>
            {cell}
          </div>
        ))}
      </div>
      <button onClick={restartGame}>Restart Game</button>
      <p>{status}</p>
    </div>
  );
};

export default App;
