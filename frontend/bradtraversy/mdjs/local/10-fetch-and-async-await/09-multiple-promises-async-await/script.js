function getData(endpoint) {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();

    xhr.open('GET', endpoint);

    xhr.onreadystatechange = function () {
      if (this.readyState === 4) {
        if (this.status === 200) {
          resolve(JSON.parse(this.responseText));
        } else {
          reject('Something went wrong');
        }
      }
    };

    setTimeout(() => {
      xhr.send();
    }, Math.floor(Math.random() * 3000) + 1000);
  });
}

const moviesPromise = getData('./movies.json');
const actorsPromise = getData('./actors.json');
const directorsPromise = getData('./directors.json');

async function geyAllData() {
  const movies = await getData('./movies.json');
  const actors = await getData('./actors.json');
  const directors = await getData('./directors.json');
  console.log(movies, actors, directors);
}
// geyAllData();

async function geyAllDataWithFetch() {
  const moviesRes = await fetch('./movies.json');
  const moives = await moviesRes.json();
  const actorsRes = await fetch('./actors.json');
  const actors = await actorsRes.json();
  const directorsRes = await fetch('./directors.json');
  const directors = await directorsRes.json();
  console.log(moives, actors, directors);
}

// geyAllDataWithFetch();

async function geyAllDataAllPromise() {
  const [moviesRes, actorsRes, directorsRes] = await Promise.all([
    fetch('./movies.json'),
    fetch('./actors.json'),
    fetch('./directors.json'),
  ]);

  const moives = await moviesRes.json();

  const actors = await actorsRes.json();
  const directors = await directorsRes.json();
  console.log(moives, actors, directors);
}

// geyAllDataAllPromise();

async function geyAllDataAllPromise2() {
  const [movies, actors, directors] = await Promise.all([
    fetch('./movies.json').then((res) => res.json()),
    fetch('./actors.json').then((res) => res.json()),
    fetch('./directors.json').then((res) => res.json()),
  ]);
  console.log(movies, actors, directors);
}

geyAllDataAllPromise2();
