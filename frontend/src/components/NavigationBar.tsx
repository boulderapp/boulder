import { ReactNode } from "react";

const NavigationBar = ({ children }: { children: ReactNode }) => {
  return (
    <div className="absolute top-0 bg-boulder-brown font-serif text-boulder-beige w-screen h-24 grid">
      {children}
    </div>
  );
};

export default NavigationBar;
