import React from 'react';

function Button({ children, type, version = 'primary', isDisable }) {
  return (
    <button className={`btn btn-${version}`} disabled={isDisable}>
      {children}
    </button>
  );
}

export default Button;
