// const jokeEl = document.getElementById('joke');
// const jokeBtn = document.getElementById('joke-btn');

// const generateJoke = () => {
//   const xhr = new XMLHttpRequest();

//   xhr.onreadystatechange = function () {
//     if (this.readyState === 4) {
//       if (this.status === 200) {
//         // console.log(JSON.parse(this.responseText).value);
//         jokeEl.innerHTML = JSON.parse(this.responseText).value;
//       } else {
//         jokeEl.innerHTML = 'Something Went Wrong (Not Funny)';
//       }
//     }
//   };

//   xhr.send();
// };

// jokeBtn.addEventListener('click', generateJoke);
// document.addEventListener('DOMContentLoaded', generateJoke);

const jokeEl = document.getElementById('joke');
const jokeBtn = document.getElementById('joke-btn');

function generateJoke() {
  const xhr = new XMLHttpRequest();

  xhr.open('get', 'https://api.chucknorris.io/jokes/random1');

  xhr.onreadystatechange = function () {
    if (this.readyState === 4) {
      if (this.status === 200) {
        console.log(JSON.parse(this.responseText).value);
        jokeEl.innerHTML = JSON.parse(this.responseText).value;
      } else {
        jokeEl.innerHTML = 'something went wrong';
      }
    }
  };

  xhr.send();
}

jokeBtn.addEventListener('click', generateJoke);
document.addEventListener('DOMContentLoaded', generateJoke);
