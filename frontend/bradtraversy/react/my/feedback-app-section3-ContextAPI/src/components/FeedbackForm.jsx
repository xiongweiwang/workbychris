import { useState, useContext, useEffect } from 'react';
import Card from './shared/Card.jsx';
import Button from './shared/Button.jsx';
import RatingSelect from './RatingSelect.jsx';
import FeedbackContext from '../context/FeedbackContext';

function FeedbackForm() {
  const [rating, setRating] = useState(10);
  const [text, setText] = useState('');
  const [btnDisabled, setBtnDisabled] = useState(true);
  const [message, setMessage] = useState('');

  const { addFeedback, feedbackEdit, updateFeedback } =
    useContext(FeedbackContext);

  useEffect(() => {
    if (feedbackEdit.edit === true) {
      setBtnDisabled(false);
      setText(feedbackEdit.item.text);
      setRating(feedbackEdit.item.rating);
    }
  }, [feedbackEdit]);

  //The issue is likely because handleTextChange isn't getting triggered when selecting part of the text and using backspace to delete it.
  //This behavior might occur because you're using text in the handleTextChange logic,
  //but the actual value of the input field (e.target.value) hasn't been updated yet when the event is fired.

  // const handleTextChange = (e) => {
  //   if (text === "") {
  //     setBtnDisabled(() => true);
  //     setMessage(null);
  //   } else if (text !== "" && text.trim().length < 10) {
  //     setBtnDisabled(() => true);
  //     setMessage("Text must be at least 10 characters");
  //   } else {
  //     setBtnDisabled(() => false);
  //     setMessage(null);
  //   }
  //   setText(e.target.value);
  // };

  //fix the problem
  const handleTextChange = (e) => {
    const inputValue = e.target.value;

    if (inputValue === '') {
      setBtnDisabled(true);
      setMessage(null);
    } else if (inputValue.trim().length <= 10) {
      setBtnDisabled(true);
      setMessage('Text must be at least 10 characters');
    } else {
      setBtnDisabled(false);
      setMessage(null);
    }

    setText(inputValue);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (text.trim().length > 10) {
      const newFeedback = {
        text,
        rating,
      };
      console.log('New Feedback:', newFeedback); // Debugging step
      if (feedbackEdit.edit === true) {
        updateFeedback(feedbackEdit.item.id, newFeedback);
      } else {
        addFeedback(newFeedback);
      }
      setText('');
      setBtnDisabled(true);
    }
  };

  return (
    <Card>
      <form onSubmit={handleSubmit}>
        <h2>rate you service</h2>
        <RatingSelect select={(rating) => setRating(rating)} />
        <div className="input-group">
          <input
            type="text"
            placeholder="write text"
            value={text}
            onChange={handleTextChange}
          />
          <Button type="submit" version="secondary" isDisabled={btnDisabled}>
            send
          </Button>
        </div>
        {message && <div className="message">{message}</div>}
      </form>
    </Card>
  );
}

export default FeedbackForm;
