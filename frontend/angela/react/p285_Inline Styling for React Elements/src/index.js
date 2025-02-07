import React from "react";
import ReactDOM from "react-dom";

const customStyle = {
  color: "blue",
  fontSize: "20px",
  border: "1px solid lightblue"
};

customStyle.color = "red";

ReactDOM.render(
  <div>
    <h1 style={customStyle}>My Favourite Foods</h1>
    <ul>
      <li>Bacon</li>
      <li>Jamon</li>
      <li>Noodles</li>
    </ul>
  </div>,
  document.getElementById("root")
);
