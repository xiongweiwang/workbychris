const promise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('promise consume');
  }, 1000);
});

promise.then((data) => console.log(data));

new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve('promise consume2');
  }, 2000);
}).then((data) => console.log(data));

const getData = new Promise((resolve, reject) => {
  let error = false;
  if (!error) {
    setTimeout(() => {
      resolve('promise consume3');
    }, 3000);
  } else {
    reject('promise consume3 went wrong');
  }
});

getData
  .then((data) => console.log(data))
  .catch((error) => console.log(error))
  .finally(() => console.log('The promise has been resolved or rejected'));
console.log('global scope');
