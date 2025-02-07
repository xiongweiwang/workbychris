import useFetch from '../hooks/useFetch';
import React, { useEffect, useState } from 'react';

function CustomHookExample1() {
  const { data, loading } = useFetch(
    'https://jsonplaceholder.typicode.com/posts',
    {}
  );

  // const [renderCount, setRenderCount] = useState(1);

  // useEffect(() => {
  //   // if (loading === false) {
  //   //   setRenderCount((prev) => prev + 1);
  //   // }

  //   console.log(data, loading); // 每次渲染时都会打印
  // }, [loading, data]);

  console.log(data, loading); // 每次渲染时都会打印

  if (loading) {
    return <h3>Loading...</h3>;
  }

  return (
    <div>
      {/* <h1>render: {renderCount}</h1> */}
      {data.map((post) => (
        <h3 key={post.id}>{post.title}</h3>
      ))}
    </div>
  );
}

export default React.memo(CustomHookExample1);
