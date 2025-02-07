import {
  NavLink,
  Navigate,
  useNavigate,
  Routes,
  Route,
} from 'react-router-dom';

function Post() {
  const navigate = useNavigate();
  const status = 200;
  if (status == 404) {
    return <Navigate to="/notfound" />;
  }

  const handleClick = (e) => {
    console.log('button click');
    navigate('/about');
  };
  return (
    <div>
      <h1>Post</h1>
      <button onClick={handleClick}>Click</button>
      <Routes>
        <Route path="/show" element={<h1>post/show</h1>} />
      </Routes>
    </div>
  );
}

export default Post;

// import { useParams } from 'react-router-dom';

// function Post() {
//   const param = useParams();
//   return (
//     <div>
//       <h1>Post: {param.id}</h1>
//       <p>name: {param.name}</p>
//     </div>
//   );
// }

// export default Post;
