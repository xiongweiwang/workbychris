export default function log({ turns }) {
  return (
    <ol id="log">
      {turns.map((turn) => (
        <li key={`${turn.square.row}${turn.square.col}`}>
          {turn.player} selected {turn.square.row}行,{turn.square.col}列
        </li>
      ))}
    </ol>
  );
}
