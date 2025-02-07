import Header from './components/Header';
import FeedbackList from './components/FeedbackList';
import FeedbackData from './data/FeedbackData.js';
import Feedbackstats from './components/Feedbackstats.jsx';
import FeedbackForm from './components/FeedbackForm.jsx';
import { useState } from 'react';
import { v4 as uuidv4 } from 'uuid';

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
    <>
      <Header text="Header text" />
      <FeedbackForm feedback={feedback} handleAdd={addFeedback} />
      <Feedbackstats feedback={feedback} />
      <FeedbackList feedback={feedback} handleDelete={deleteFeedback} />
    </>
  );
}

export default APP;
