import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Header from './components/Header';
import FeedbackForm from './components/FeedbackForm.jsx';
import FeedbackList from './components/FeedbackList';
import Feedbackstats from './components/Feedbackstats.jsx';
import AboutPage from './pages/AboutPage.jsx';
import AboutIconLink from './components/AboutIconLink.jsx';
import { FeedbackProvider } from './context/FeedbackContext.js';

function APP() {
  return (
    <FeedbackProvider>
      <Router>
        <Header text="Header text" />
        <div className="container">
          <Routes>
            {/* Default Route */}
            <Route
              path="/"
              element={
                <>
                  <FeedbackForm />
                  <Feedbackstats />
                  <FeedbackList />
                </>
              }
            />
            {/* About Page Route */}
            <Route path="/about" element={<AboutPage />} />
          </Routes>
          <AboutIconLink />
        </div>
      </Router>
    </FeedbackProvider>
  );
}

export default APP;
