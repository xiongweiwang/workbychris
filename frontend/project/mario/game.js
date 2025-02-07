const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

// Mario properties
let mario = {
  x: 50,
  y: 300,
  width: 50,
  height: 50,
  color: 'red',
  speed: 5,
  maxSpeed: 10,
  baseJumpPower: 15,
  jumpPower: 15,
  velocityY: 0,
  isJumping: false,
};

// Arrays to hold multiple enemies and platforms
let enemies = [];
let platforms = [];

// Game variables
let score = 0;
let gameOver = false;
const gravity = 0.5;
const enemySpeedRange = { min: 1, max: 4 };
const spawnIntervalRange = { min: 2000, max: 3500 };
const platformSpawnInterval = 3000;
const maxPlatforms = 3;
const platformLifetime = 1000;
const xKeyCooldownTime = 3000; // 3 seconds cooldown for X key

// Freeze cooldown variables
let freezeCooldown = false;
let freezeDuration = 3000; // 3 seconds
let freezeStartTime = 0;

// Track X key cooldown
let xKeyCooldownActive = false;

// Function to draw cooldown bar in the upper right corner
function drawFreezeCooldown() {
  if (freezeCooldown) {
    const elapsed = Date.now() - freezeStartTime;
    const barWidth = 100;
    const barHeight = 10;
    const fillWidth = Math.min((elapsed / freezeDuration) * barWidth, barWidth);

    // Position bar in the upper right corner
    const barX = canvas.width - barWidth - 10;
    const barY = 10;

    ctx.fillStyle = 'gray';
    ctx.fillRect(barX, barY, barWidth, barHeight); // Background bar
    ctx.fillStyle = 'blue';
    ctx.fillRect(barX, barY, fillWidth, barHeight); // Filling countdown

    // Display "X Cooldown" label
    ctx.fillStyle = 'black';
    ctx.font = '12px Arial';
    ctx.fillText('X Cooldown', barX, barY - 5);

    // Reset cooldown when duration has passed
    if (elapsed >= freezeDuration) {
      freezeCooldown = false;
    }
  }
}

// Function to handle the X cooldown effect
function handleXCooldown() {
  if (!freezeCooldown) {
    mario.jumpPower = 20; // Increase jump power when X is first pressed
    freezeCooldown = true;
    freezeStartTime = Date.now();
  }
}

// Function to draw platforms
function drawPlatforms() {
  platforms.forEach((platform, index) => {
    platform.lifetime--;
    platform.x -= 2;
    ctx.fillStyle = platform.color;
    ctx.fillRect(platform.x, platform.y, platform.width, platform.height);
    if (platform.lifetime <= 0 || platform.x + platform.width < 0) {
      platforms.splice(index, 1); // Remove expired or off-screen platforms
    }
  });
}

// Draw Mario
function drawMario() {
  ctx.fillStyle = mario.color;
  ctx.fillRect(mario.x, mario.y, mario.width, mario.height);
}

// Draw each enemy
function drawEnemies() {
  enemies.forEach((enemy) => {
    ctx.fillStyle = enemy.color;
    ctx.fillRect(enemy.x, enemy.y, enemy.width, enemy.height);
  });
}

// Draw Score
function drawScore() {
  ctx.fillStyle = 'black';
  ctx.font = '20px Arial';
  ctx.fillText('Score: ' + score, 10, 20);
}

// Display Game Over
function displayGameOver() {
  ctx.fillStyle = 'black';
  ctx.font = '40px Arial';
  ctx.fillText('Game Over!', canvas.width / 2 - 100, canvas.height / 2);
}

// Update game state
function update() {
  if (gameOver) return;

  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Determine Mario's speed based on Z key
  const currentSpeed = zPressed ? mario.maxSpeed : mario.speed;

  // Move Mario based on key states
  if (movingRight && mario.x < canvas.width - mario.width) {
    mario.x += currentSpeed;
  }
  if (movingLeft && mario.x > 0) {
    mario.x -= currentSpeed;
  }

  // Apply gravity to Mario
  mario.y += mario.velocityY;
  mario.velocityY += gravity;

  // Check if Mario is on a platform
  platforms.forEach((platform) => {
    if (
      mario.y + mario.height >= platform.y &&
      mario.y + mario.height <= platform.y + mario.velocityY &&
      mario.x + mario.width > platform.x &&
      mario.x < platform.x + platform.width
    ) {
      mario.y = platform.y - mario.height;
      mario.velocityY = 0;
      mario.isJumping = false;
    }
  });

  // Prevent Mario from falling through the floor
  if (mario.y > 300) {
    mario.y = 300;
    mario.velocityY = 0;
    mario.isJumping = false;
  }

  // Move each enemy leftward and remove if off-screen
  enemies.forEach((enemy, index) => {
    enemy.x -= enemy.speed;
    if (enemy.jumping) {
      enemy.y += enemy.velocityY;
      enemy.velocityY += gravity;

      // Reverse jump if enemy touches the ground
      if (enemy.y >= 300) {
        enemy.y = 300;
        enemy.velocityY = -Math.random() * 10;
      }
    }
    if (enemy.x + enemy.width < 0) {
      enemies.splice(index, 1);
    }
  });

  // Check for collisions between Mario and each enemy
  enemies.forEach((enemy) => {
    if (checkCollision(mario, enemy)) {
      gameOver = true;
    }
  });

  // Increase score over time
  score++;

  // Draw everything
  drawMario();
  drawEnemies();
  drawPlatforms();
  drawScore();
  drawFreezeCooldown(); // Draw cooldown bar in upper right corner

  if (gameOver) {
    displayGameOver();
  } else {
    requestAnimationFrame(update);
  }
}

// Collision detection
function checkCollision(rect1, rect2) {
  return (
    rect1.x < rect2.x + rect2.width &&
    rect1.x + rect1.width > rect2.x &&
    rect1.y < rect2.y + rect2.height &&
    rect1.y + rect1.height > rect2.y
  );
}

// Spawn a new enemy on the right side of the canvas
function spawnEnemy() {
  let enemy = {
    x: canvas.width,
    y: 300,
    width: 50,
    height: 50,
    color: 'green',
    speed:
      Math.random() * (enemySpeedRange.max - enemySpeedRange.min) +
      enemySpeedRange.min,
  };
  enemies.push(enemy);

  const nextSpawnTime =
    Math.random() * (spawnIntervalRange.max - spawnIntervalRange.min) +
    spawnIntervalRange.min;
  setTimeout(spawnEnemy, nextSpawnTime);
}

// Spawn platforms periodically
function spawnPlatform() {
  if (platforms.length < maxPlatforms) {
    let platform = {
      x: canvas.width,
      y: Math.random() * 100 + 180,
      width: 100,
      height: 10,
      color: 'blue',
      lifetime: platformLifetime,
    };
    platforms.push(platform);
  }
  setTimeout(spawnPlatform, platformSpawnInterval);
}

// Reset the game
function resetGame() {
  mario.x = 50;
  mario.y = 300;
  mario.velocityY = 0;
  enemies = [];
  platforms = [];
  score = 0;
  gameOver = false;
  update();
}

// Jump function for Mario
function jumpMario() {
  if (!mario.isJumping) {
    mario.velocityY = -mario.jumpPower;
    mario.isJumping = true;
  }
}

// Handle the X key cooldown timer
function startXKeyCooldown() {
  xKeyCooldownActive = true;
  setTimeout(() => {
    xKeyCooldownActive = false;
  }, xKeyCooldownTime);
}

// Movement control
let movingRight = false;
let movingLeft = false;
let zPressed = false;

// Event listeners
document.addEventListener('keydown', (event) => {
  if (event.key === 'ArrowRight') {
    movingRight = true;
  }
  if (event.key === 'ArrowLeft') {
    movingLeft = true;
  }
  if (event.key === 'Z' || event.key === 'z') {
    zPressed = true;
  }
  if (event.key === ' ' || event.key === 'Space' || event.key === 'ArrowUp') {
    event.preventDefault();
    jumpMario();
  }
  if (event.key === 'X' || event.key === 'x') {
    if (!xKeyCooldownActive) {
      mario.jumpPower = 20;
      jumpMario();
      startXKeyCooldown(); // Activate cooldown after using X jump
    }
  }
});

document.addEventListener('keyup', (event) => {
  if (event.key === 'ArrowRight') {
    movingRight = false;
  }
  if (event.key === 'ArrowLeft') {
    movingLeft = false;
  }
  if (event.key === 'Z' || event.key === 'z') {
    zPressed = false;
  }
  if (event.key === 'X' || event.key === 'x') {
    mario.jumpPower = mario.baseJumpPower; // Reset jump power
  }
  if (event.key === 'r' && gameOver) {
    resetGame();
  }
});

// Start the game
update();
spawnEnemy();
spawnPlatform();
ventListener;
