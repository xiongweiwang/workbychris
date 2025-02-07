import { useRef, useState } from 'react';

export default function Player() {
  const [enteredName, setEnteredName] = useState(null);
  const playerName = useRef();
  // const [submitted, setSubmitted] = useState(false);

  // log input value on every keystoke
  // function handleChange(event) {
  //   setSubmitted(false);
  //   setEnteredName(event.target.value);
  // }

  function handleClick() {
    setEnteredName(playerName.current.value);
    playerName.current.value = '';
  }

  return (
    <section id="player">
      <h2>Welcome {enteredName ?? 'unknown entity'}</h2>
      <p>
        <input
          ref={playerName}
          type="text"
          // onChange={handleChange}
          // value={enteredName}
        />
        <button onClick={handleClick}>Set Name</button>
      </p>
    </section>
  );
}
