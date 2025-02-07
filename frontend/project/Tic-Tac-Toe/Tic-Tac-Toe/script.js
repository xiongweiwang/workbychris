let board = ['', '', '', '', '', '', '', '', ''];
let currentPlayer = 'X';
let gameActive = true;

const winningCombinations = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

const cells = document.querySelectorAll('.cell');
const statusText = document.getElementById('status');
const restartButton = document.getElementById('restart');

cells.forEach((cell) => cell.addEventListener('click', handleCellClick));
restartButton.addEventListener('click', restartGame);

function handleCellClick(e) {
  const cellIndex = e.target.getAttribute('data-index');

  if (board[cellIndex] !== '' || !gameActive) return;

  board[cellIndex] = currentPlayer;
  e.target.textContent = currentPlayer;

  if (checkWin()) {
    statusText.textContent = `Player ${currentPlayer} wins!`;
    gameActive = false;
  } else if (board.every((cell) => cell !== '')) {
    statusText.textContent = "It's a draw!";
    gameActive = false;
  } else {
    currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
    statusText.textContent = `Player ${currentPlayer}'s turn`;
  }
}

function checkWin() {
  return winningCombinations.some((combination) => {
    return combination.every((index) => board[index] === currentPlayer);
  });
}

function restartGame() {
  board = ['', '', '', '', '', '', '', '', ''];
  currentPlayer = 'X';
  gameActive = true;
  statusText.textContent = "Player X's turn";
  cells.forEach((cell) => (cell.textContent = ''));
}
