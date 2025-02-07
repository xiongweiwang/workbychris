//Create a react app from scratch.
//It should display 2 paragraph HTML elements.
//The paragraphs should say:
//Created by YOURNAME.
//Copyright CURRENTYEAR.
//E.g.
//Created by Angela Yu.
//Copyright 2019.

import React from "react";
import ReactDOM from "react-dom";

const fName = "Angela";
const lName = "Yu";

function getLucklyNumber() {
  return Math.floor(Math.random() * 10);
}

const lucklyNumber = getLucklyNumber();

const currentYear = new Date().getFullYear();

const currentTime = Date.now();
const now = new Date();
const day = now.getDay(); // returns a number representing the day of the week, starting with 0 for Sunday
const hours = now.getHours();
const minutes = now.getMinutes();
console.log();

ReactDOM.render(
  <div>
    <h1>Created by {fName + " " + lName}</h1>

    <p>You luckly number is {lucklyNumber}</p>
    <p>You luckly number is {Math.floor(Math.random() * 10)}</p>

    <p>copyright {currentYear}</p>
    <p>currentTime: {currentTime}</p>
    <p>
      copyright Today is day {`${day} and the time is ${hours}:${minutes}.`}
    </p>
  </div>,
  document.getElementById("root")
);
