import React from "react";

function ToDoItem(props) {
  return (
    <div
      onClick={() => {
        props.onChecked(props.id);
      }}
    >
      <li>{props.text}</li>
    </div>
  );
}

export default ToDoItem;




// import React, { useState } from "react";

// function ToDoItem(props) {
//   const [isClicked, setIsClicked] = useState(false);

//   function handleClickItem() {
//     setIsClicked(!isClicked);
//   }

//   return (
//     <li
//       style={{ textDecoration: isClicked ? "line-through" : "none" }}
//       onClick={handleClickItem}
//     >
//       {props.text}
//     </li>
//   );
// }

// export default ToDoItem;

