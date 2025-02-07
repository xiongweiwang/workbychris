const gridSize = 10;
const winCondition = 5; // 5 consecutive cells needed to win
let board = Array(gridSize * gridSize).fill('');
let currentPlayer = 'X';
let gameActive = true;

const boardElement = document.getElementById('board');
const statusText = document.getElementById('status');
const restartButton = document.getElementById('restart');

// Create the 10x10 grid dynamically
function createBoard() {
  boardElement.innerHTML = '';
  board.forEach((_, index) => {
    const cell = document.createElement('div');
    cell.classList.add('cell');
    cell.setAttribute('data-index', index);
    cell.addEventListener('click', handleCellClick);
    boardElement.appendChild(cell);
  });
}

// Handle cell clicks
function handleCellClick(e) {
  const cellIndex = e.target.getAttribute('data-index');

  if (board[cellIndex] !== '' || !gameActive) return;

  board[cellIndex] = currentPlayer;
  e.target.textContent = currentPlayer;

  if (checkWin(cellIndex)) {
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

// Check for a win condition
function checkWin(index) {
  const row = Math.floor(index / gridSize);
  const col = index % gridSize;

  return (
    checkDirection(row, col, 1, 0) || // Horizontal
    checkDirection(row, col, 0, 1) || // Vertical
    checkDirection(row, col, 1, 1) || // Diagonal down-right
    checkDirection(row, col, 1, -1) // Diagonal down-left
  );
}

// Check a specific direction for a win
function checkDirection(row, col, rowIncrement, colIncrement) {
  let count = 1;

  // Check in the positive direction
  count += countConsecutive(row, col, rowIncrement, colIncrement);

  // Check in the negative direction
  count += countConsecutive(row, col, -rowIncrement, -colIncrement);

  return count >= winCondition;
}

// Count consecutive cells in a specific direction
function countConsecutive(row, col, rowIncrement, colIncrement) {
  let consecutive = 0;
  let r = row + rowIncrement;
  let c = col + colIncrement;

  while (
    r >= 0 &&
    r < gridSize &&
    c >= 0 &&
    c < gridSize &&
    board[r * gridSize + c] === currentPlayer
  ) {
    consecutive++;
    r += rowIncrement;
    c += colIncrement;
  }

  return consecutive;
}

// Restart the game
function restartGame() {
  board = Array(gridSize * gridSize).fill('');
  currentPlayer = 'X';
  gameActive = true;
  statusText.textContent = "Player X's turn";
  createBoard();
}

// Initial setup
createBoard();
restartButton.addEventListener('click', restartGame);
