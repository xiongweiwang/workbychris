import React from "react";

function ToDoItem(props) {
  return (
    <li
      onClick={() => {
        props.onChecked(props.id); // Uses the unique id passed in
      }}
    >
      {props.text}
    </li>
  );
}

export default ToDoItem;
