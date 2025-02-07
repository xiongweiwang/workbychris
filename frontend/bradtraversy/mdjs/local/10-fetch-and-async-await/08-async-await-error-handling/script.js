// const getUser = async () => {
//   try {
//     const response = await fetch('https://jsonplaceholder.typicode.com/posts');

//     if (!response.ok) {
//       throw new Error('error occur');
//     }

//     const data = await response.text();
//     console.log(data);
//   } catch (error) {
//     console.log(error);
//   }
// };

// getUser();

const getPost = async () => {
  const response = await fetch('http://httpstat.us/500');

  if (!response.ok) {
    throw new Error('error occur');
  }

  const data = await response.text();
  console.log(data);
};

getPost().catch((error) => console.log(error));

// ('https://jsonplaceholder.typicode.com/posts');
// ('http://httpstat.us/500');
