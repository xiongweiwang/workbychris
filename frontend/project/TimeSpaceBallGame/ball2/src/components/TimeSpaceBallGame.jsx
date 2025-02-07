import React, { useEffect, useRef, useState } from 'react';
import * as THREE from 'three';
import { gsap } from 'gsap';
import Header from './Header'; // Import Header component

function TimeSpaceBallGame() {
  const canvasRef = useRef(null);
  const sceneRef = useRef(null);
  const cameraRef = useRef(null);
  const rendererRef = useRef(null);
  const [score, setScore] = useState(0);
  const [timeRemaining, setTimeRemaining] = useState(100);
  const [gameOver, setGameOver] = useState(false);
  const [speed, setSpeed] = useState(0.05);
  const [radius, setRadius] = useState(2);
  const [isGameRunning, setIsGameRunning] = useState(false);
  const [timeLimit, setTimeLimit] = useState(100);
  const [isPaused, setIsPaused] = useState(false);
  const ballsRef = useRef([]);
  const gameIntervalRef = useRef(null);
  const timerRef = useRef(null);

  const raycaster = new THREE.Raycaster();
  const mouse = new THREE.Vector2();

  useEffect(() => {
    const scene = new THREE.Scene();
    const camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );
    const renderer = new THREE.WebGLRenderer({ canvas: canvasRef.current });
    renderer.setSize(window.innerWidth, window.innerHeight);
    camera.position.z = 10;

    sceneRef.current = scene;
    cameraRef.current = camera;
    rendererRef.current = renderer;

    const light = new THREE.AmbientLight(0xffffff, 1);
    scene.add(light);

    const animate = () => {
      renderer.render(scene, camera);
      requestAnimationFrame(animate);
    };
    animate();

    return () => renderer.dispose();
  }, []);

  const createBall = () => {
    const scene = sceneRef.current;
    if (!scene || ballsRef.current.length >= 5) return;

    const geometry = new THREE.SphereGeometry(radius, 32, 32);
    const material = new THREE.MeshStandardMaterial({
      color: randomColor(),
      roughness: 0.5,
      metalness: 0.5,
    });

    const ball = new THREE.Mesh(geometry, material);
    ball.position.set(
      randomPosition().x,
      randomPosition().y,
      randomPosition().z
    );
    ball.userData = { clicked: false };

    scene.add(ball);
    ballsRef.current.push(ball);

    setTimeout(() => {
      if (scene && ball) {
        scene.remove(ball);
        ballsRef.current = ballsRef.current.filter((b) => b !== ball);
      }
    }, 5000);

    moveBallSmoothly(ball);
  };

  const randomPosition = () => {
    return {
      x: Math.random() * 10 - 5,
      y: Math.random() * 10 - 5,
      z: Math.random() * 10 - 5,
    };
  };

  const randomColor = () => {
    return new THREE.Color(Math.random(), Math.random(), Math.random());
  };

  const moveBallSmoothly = (ball) => {
    gsap.to(ball.position, {
      x: randomPosition().x,
      y: randomPosition().y,
      z: randomPosition().z,
      duration: Math.random() * 3 + 2,
      ease: 'power2.out',
      onComplete: () => moveBallSmoothly(ball),
    });
  };

  const handleMouseClick = (event) => {
    const rect = canvasRef.current.getBoundingClientRect();
    mouse.x = ((event.clientX - rect.left) / rect.width) * 2 - 1;
    mouse.y = -((event.clientY - rect.top) / rect.height) * 2 + 1;

    raycaster.setFromCamera(mouse, cameraRef.current);

    const intersects = raycaster.intersectObjects(ballsRef.current);
    if (intersects.length > 0) {
      const ball = intersects[0].object;
      handleBallClick(ball);
    }
  };

  const handleBallClick = (ball) => {
    if (ball.userData.clicked) return;

    ball.userData.clicked = true;
    createSplashEffect(ball);
    setScore((prev) => prev + 10);

    sceneRef.current.remove(ball);
    ballsRef.current = ballsRef.current.filter((b) => b !== ball);
  };

  const createSplashEffect = (ball) => {
    const particles = [];
    const particleGeometry = new THREE.SphereGeometry(0.1, 8, 8);
    const particleMaterial = new THREE.MeshBasicMaterial({
      color: ball.material.color,
    });

    for (let i = 0; i < 20; i++) {
      const particle = new THREE.Mesh(particleGeometry, particleMaterial);
      particle.position.copy(ball.position);
      particles.push(particle);
      sceneRef.current.add(particle);

      gsap.to(particle.position, {
        x: particle.position.x + (Math.random() - 0.5) * 2,
        y: particle.position.y + (Math.random() - 0.5) * 2,
        z: particle.position.z + (Math.random() - 0.5) * 2,
        duration: 1,
        ease: 'power2.out',
        onComplete: () => {
          sceneRef.current.remove(particle);
        },
      });

      gsap.to(particle.material, {
        opacity: 0,
        duration: 1,
      });
    }
  };

  const handleStartGame = () => {
    setIsGameRunning(true);
    setIsPaused(false);
    setScore(0);
    setTimeRemaining(timeLimit);
    setGameOver(false);

    gameIntervalRef.current = setInterval(() => {
      if (ballsRef.current.length < 5) createBall();
    }, 1000);

    timerRef.current = setInterval(() => {
      setTimeRemaining((prev) => {
        if (prev <= 1) {
          clearInterval(timerRef.current);
          clearInterval(gameIntervalRef.current);
          setGameOver(true);
          setIsGameRunning(false);
        }
        return prev - 1;
      });
    }, 1000);
  };

  const handleStopGame = () => {
    clearInterval(timerRef.current);
    clearInterval(gameIntervalRef.current);
    setIsGameRunning(false);
    setGameOver(true);
    setTimeRemaining(timeLimit);
    ballsRef.current.forEach((ball) => sceneRef.current.remove(ball));
    ballsRef.current = [];
  };

  const handlePauseGame = () => {
    if (isPaused) {
      handleResumeGame();
    } else {
      setIsPaused(true);
      clearInterval(timerRef.current);
      clearInterval(gameIntervalRef.current);
    }
  };

  const handleResumeGame = () => {
    setIsPaused(false);
    gameIntervalRef.current = setInterval(() => {
      if (ballsRef.current.length < 5) createBall();
    }, 1000);

    timerRef.current = setInterval(() => {
      setTimeRemaining((prev) => {
        if (prev <= 1) {
          clearInterval(timerRef.current);
          clearInterval(gameIntervalRef.current);
          setGameOver(true);
          setIsGameRunning(false);
        }
        return prev - 1;
      });
    }, 1000);
  };

  return (
    <div>
      <Header
        score={score}
        timeLimit={timeLimit}
        timeRemaining={timeRemaining}
        speed={speed}
        radius={radius}
        handleSpeedChange={(e) => setSpeed(parseFloat(e.target.value))}
        handleRadiusChange={(e) => setRadius(parseFloat(e.target.value))}
        handleTimeLimitChange={(e) => {
          setTimeLimit(parseInt(e.target.value));
          setTimeRemaining(parseInt(e.target.value));
        }}
      />
      <div className="game-container">
        <canvas ref={canvasRef} onClick={handleMouseClick} />
        <button onClick={isGameRunning ? handleStopGame : handleStartGame}>
          {isGameRunning ? 'Stop Game' : 'Start Game'}
        </button>
        {isGameRunning && (
          <button onClick={handlePauseGame}>
            {isPaused ? 'Resume Game' : 'Pause Game'}
          </button>
        )}
        {gameOver && <div>Game Over! Final Score: {score}</div>}
      </div>
    </div>
  );
}

export default TimeSpaceBallGame;
