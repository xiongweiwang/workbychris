const posts = [
  { title: 'Post One', body: 'This is post one' },
  { title: 'Post Two', body: 'This is post two' },
];

function createPost(post) {
  return new Promise((resolve, reject) => {
    let error = false;
    if (!error) {
      setTimeout(() => {
        posts.push(post);
        resolve();
      }, 2000);
    } else {
      reject('something went wrong');
    }
  });
}

function getPosts() {
  setTimeout(() => {
    posts.forEach((post) => {
      const div = document.createElement('div');
      div.innerHTML = `<strong>${post.title}</strong> - ${post.body}`;
      document.getElementById('posts').appendChild(div);
    });
  }, 1000);
}

function showErr(error) {
  const h3 = document.createElement('h3');
  h3.innerHTML = `<strong>${error}</strong>`;
  document.getElementById('posts').appendChild(h3);
}

createPost({ title: 'Post three', body: 'Post three' })
  .then(getPosts)
  .catch(showErr);

// getPosts();
