import React from "react";
import ReactDOM from "react-dom";

const fName = "Angela";
const lName = "Yu";

function getLucklyNumber() {
  return Math.floor(Math.random() * 10);
}

const lucklyNumber = getLucklyNumber();

ReactDOM.render(
  <div>
    <h1>Hello {fName + " " + lName}</h1>
    <h1>Hello {fName} {lName}</h1>
    <h1>Hello {`${fName} ${lName}`}</h1>
    <p>You luckly number is {lucklyNumber}</p>
    <p>You luckly number is {Math.floor(Math.random() * 10)}</p>
  </div>,
  document.getElementById("root")
);
