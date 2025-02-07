import {
  BrowserRouter as Router,
  Routes,
  Route,
  NavLink,
} from 'react-router-dom';
import { useState } from 'react';
import { v4 as uuidv4 } from 'uuid';

import Header from './components/Header';
import FeedbackData from './data/FeedbackData.js';
import FeedbackForm from './components/FeedbackForm.jsx';
import FeedbackList from './components/FeedbackList';
import Feedbackstats from './components/Feedbackstats.jsx';
import AboutPage from './pages/AboutPage.jsx';
import AboutIconLink from './components/AboutIconLink.jsx';
import Card from './components/shared/Card.jsx';
import Post from './components/Post.jsx';

function APP() {
  const [feedback, setFeedback] = useState(FeedbackData);

  const deleteFeedback = (id) => {
    // console.log('app', id);
    if (window.confirm('Are you sure you want to delete?')) {
      setFeedback(feedback.filter((item) => item.id !== id));
    }
  };

  const addFeedback = (newFeedback) => {
    newFeedback.id = uuidv4();
    setFeedback([newFeedback, ...feedback]);
  };

  return (
    <Router>
      <Header text="Header text" />
      <div className="container">
        <Routes>
          {/* Default Route */}
          <Route
            exact
            path="/"
            element={
              <>
                <FeedbackForm feedback={feedback} handleAdd={addFeedback} />
                <Feedbackstats feedback={feedback} />
                <FeedbackList
                  feedback={feedback}
                  handleDelete={deleteFeedback}
                />
              </>
            }
          />
          {/* About Page Route */}
          <Route path="/about" element={<AboutPage />} />
          {/* <Route path="/post/:id/:name" element={<Post />} /> */}
          <Route path="/post/*" element={<Post />} />
        </Routes>
        <Card>
          <div className="nav">
            <NavLink to="/" activeClassName="active">
              Home
            </NavLink>
            <NavLink to="/about" activeClassName="active">
              About
            </NavLink>

            <NavLink to="/post" activeClassName="active">
              Post
            </NavLink>
            <Routes>
              <Route
                path="/post"
                element={
                  <NavLink to="show" activeClassName="active">
                    Show
                  </NavLink>
                }
              />
            </Routes>
          </div>
        </Card>
        <AboutIconLink />
      </div>
    </Router>
  );
}

export default APP;
