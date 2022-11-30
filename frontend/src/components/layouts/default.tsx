import { ReactNode } from "react";
import NavigationBar from "../NavigationBar";

const defaultLayout = ({ children }: { children: ReactNode }) => {
  return (
    <>
      <div className="bg-boulder-brown h-screen px-12 py-6 text-boulder-beige ">
        <NavigationBar />
        {children}
      </div>
    </>
  );
};

export default defaultLayout;
