import { forwardRef } from 'react';
const ResultModal = forwardRef(function ResultModal(
  { result, targetTime },
  ref
) {
  return (
    <dialog className="result-modal" ref={ref}>
      <h2>You {result}</h2>
      <p>
        targetTime:<strong>{targetTime}</strong>
      </p>
      <p>
        You stop timmer with:<strong> x second left</strong>
      </p>
      <form method="dialog">
        <button>close</button>
      </form>
    </dialog>
  );
});

export default ResultModal;
