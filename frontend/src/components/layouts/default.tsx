import { ReactNode } from "react";
import NavigationBar from "../NavigationBar";

const defaultLayout = ({ children }: { children: ReactNode }) => {
  return (
    <>
      <div className="bg-boulder-brown h-screen px-12 py-6 text-boulder-beige ">
        <NavigationBar />
        <section className="grid justify-center content-center">
          {children}
        </section>
      </div>
    </>
  );
};

export default defaultLayout;
