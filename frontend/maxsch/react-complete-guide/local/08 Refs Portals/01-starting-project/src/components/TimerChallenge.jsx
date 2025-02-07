import { useRef, useState } from 'react';
import ResultModal from './ResultModal';

export default function TimerChallenge({ title, targetTime }) {
  const timer = useRef();
  const dialog = useRef();

  const [timeExpired, setTimeExpired] = useState(false);
  const [timerStart, setTimerStart] = useState(false);

  function handleClick() {
    timer.current = setTimeout(() => {
      setTimeExpired(true);
      dialog.current.showModal();
    }, targetTime * 1000);

    setTimerStart(true);
  }

  function handleStop() {
    clearTimeout(timer.current);
    setTimerStart(false);
    setTimeExpired(false);
  }

  return (
    <>
      <ResultModal ref={dialog} result="lost" targetTime={targetTime} />
      <section className="challenge">
        <h2>{title}</h2>
        <p className="challenge-time">
          {targetTime} second {targetTime > 1 ? 's' : ''}
        </p>
        <p>
          <button onClick={timerStart ? handleStop : handleClick}>
            {timerStart ? 'Stop' : 'start Challenge'}
          </button>
        </p>
        <p className={timerStart ? 'active' : 'undefined'}>
          {timerStart ? 'Timer is running' : 'Timer inactive'}
        </p>
      </section>
    </>
  );
}
