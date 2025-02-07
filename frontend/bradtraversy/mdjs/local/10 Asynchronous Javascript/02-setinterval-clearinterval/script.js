// const intervalID = setInterval(myCallback, 1000, 'Hello');

// function myCallback(a) {
//   console.log(a, Date.now());
// }

// let intervalID;

// function startChange() {
//   if (!intervalID) {
//     intervalID = setInterval(changeRandomColor, 1000);
//   }
// }

// function changeColor() {
//   if (document.body.style.backgroundColor !== 'black') {
//     document.body.style.backgroundColor = 'black';
//     document.body.style.color = 'white';
//   } else {
//     document.body.style.backgroundColor = 'white';
//     document.body.style.color = 'black';
//   }
// }

// function changeRandomColor() {
//   const randomColor = Math.floor(Math.random() * 16777215).toString(16);
//   document.body.style.backgroundColor = `#${randomColor}`;
// }

// function stopChange() {
//   clearInterval(intervalID);
// }

// document.getElementById('start').addEventListener('click', startChange);
// document.getElementById('stop').addEventListener('click', stopChange);

//---------------------------------
// const intervalID = setInterval(myCallback, 1000, 'hello');

// function myCallback(a) {
//   console.log(a, Date.now());
// }

// function changeColor() {
//   if (document.body.style.backgroundColor != 'black') {
//     document.body.style.backgroundColor = 'black';
//     document.body.style.color = 'white';
//   } else {
//     document.body.style.backgroundColor = 'white';
//     document.body.style.color = 'black';
//   }
// }

let intervalID = null;

function startChange() {
  // 仅在 intervalID 为 null 时启动新定时器
  if (!intervalID) {
    intervalID = setInterval(changeRandomColor, 1000);
  }
}

function changeRandomColor() {
  setRandomBackgroundColor();
}

function setRandomBackgroundColor() {
  const randomColor = Math.floor(Math.random() * 16777215)
    .toString(16)
    .padStart(6, '0');
  document.body.style.backgroundColor = `#${randomColor}`;
}

function stopChange() {
  clearInterval(intervalID);
  intervalID = null; // 重置 intervalID
}

document.getElementById('start').addEventListener('click', startChange);
document.getElementById('stop').addEventListener('click', stopChange);
