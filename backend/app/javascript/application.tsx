import React from "react";
import { createRoot } from "react-dom/client";
import TestButton from "./components/utils/button";

const myApp = document.getElementById("root");
function App() {
  return <TestButton text="Dicky" />;
}

const root = createRoot(myApp!);

root.render(<App />);
