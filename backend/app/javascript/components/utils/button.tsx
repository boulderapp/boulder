import React from "react";

const TestButton = ({ text }: { text: string }) => {
  return <button className="border-black border-2 w-24 h-12">{text} </button>;
};

export default TestButton;
