const promise = new Promise((resolve, reject) => {
  setTimeout(() => {
    resolve({ name: 'John', age: 20 });
  }, 1000);
});

// promise.then((data) => console.log(data));

// async function getPromise() {
//   const response = await promise;
//   console.log(response);
// }

// async function getPromise() {
//   const res = await fetch('https://jsonplaceholder.typicode.com/users');
//   const data = res.json();
//   console.log(data);

//   // console.log(
//   //   data.forEach((info) => {
//   //     `${info.id} ----  ${info.name}`;
//   //   })
//   // );
// }

// getPromise();

const getPost = async () => {
  const res = await fetch('https://jsonplaceholder.typicode.com/posts');
  const data = await res.json();

  console.log(data);
};

getPost();
