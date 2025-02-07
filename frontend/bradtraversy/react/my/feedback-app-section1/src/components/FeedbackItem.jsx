import { FaTimes } from 'react-icons/fa';
import PropTypes from 'prop-types';

import { useState } from 'react';
import Card from './shared/Card';

function FeedbackItem({ item, handleDelete }) {
  if (!item) return null;
  return (
    <Card>
      <div className="num-display">{item.rating}</div>
      <button onClick={() => handleDelete(item.id)} className="close">
        <FaTimes color="purple" />
      </button>
      <div className="text-display">{item.text}</div>
    </Card>
  );
}

FeedbackItem.prototype = {
  item: PropTypes.object.isRequired,
};

export default FeedbackItem;
