import React, { useState } from "react";
import "./App.css"; // Import the CSS file

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="container">
      <h1>Counter App</h1>
      <div className="counter-display">{count}</div>
      <div className="button-group">
        <button onClick={() => setCount(count + 1)} className="btn add">
          + Add
        </button>
        <button onClick={() => setCount(count - 1)} className="btn subtract">
          - Subtract
        </button>
      </div>
    </div>
  );
}

export default App;
