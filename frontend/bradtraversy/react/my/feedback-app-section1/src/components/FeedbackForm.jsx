import { useState } from 'react';
import Card from './shared/Card.jsx';
import Button from './shared/Button.jsx';
import RatingSelect from './RatingSelect.jsx';

function FeedbackForm({ feedback, handleAdd }) {
  const [rating, setRating] = useState(10);
  const [text, setText] = useState('');
  const [btnDisable, setBtnDisable] = useState(true);
  const [message, setMessage] = useState('');
  const handleTextChange = (e) => {
    if (text === '') {
      setBtnDisable(true);
      setMessage(null);
    } else if (text !== '' && text.trim().length <= 10) {
      setBtnDisable(true);
      setMessage('Text must be at least 10 characters');
    } else {
      setBtnDisable(false);
      setMessage(null);
    }
    setText(e.target.value);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (text.trim().length > 10) {
      const newFeedback = {
        text,
        rating,
      };
      console.log('New Feedback:', newFeedback); // Debugging step
      handleAdd(newFeedback);
      setText('');
    }
  };
  return (
    <Card>
      <form onSubmit={handleSubmit}>
        <h2>rate you service</h2>
        <RatingSelect select={(rating) => setRating(rating)} />
        <div className="input-group">
          <input
            onChange={handleTextChange}
            type="text"
            placeholder="write text"
            value={text}
          />
          <Button type="submit" version="secondary" isDisable={btnDisable}>
            send
          </Button>
        </div>
        {message && <div className="message">{message}</div>}
      </form>
    </Card>
  );
}

export default FeedbackForm;
