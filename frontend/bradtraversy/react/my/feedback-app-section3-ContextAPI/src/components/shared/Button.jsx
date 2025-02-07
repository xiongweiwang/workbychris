import React from 'react';

function Button({ children, type, version = 'primary', isDisabled }) {
  return (
    <button className={`btn btn-${version}`} disabled={isDisabled}>
      {children}
    </button>
  );
}

export default Button;
