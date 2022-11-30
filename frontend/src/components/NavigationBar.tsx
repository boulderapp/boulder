import { ReactNode } from "react";
import { Link } from "react-router-dom";
import BoulderLogo from "../assets/images/BoulderLogo-2x.png";

const NavigationBar = ({
  children = null,
}: {
  children?: ReactNode;
}): JSX.Element => {
  return (
    <div className=" bg-boulder-brown font-serif text-boulder-beige w-screen items-center content-center grid">
      <div className="w-max row-start-1">
        <Link to="/" tabIndex={1}>
          <img src={BoulderLogo} alt="Site Logo" />
        </Link>
      </div>
      <div className="row-start-1 self-end place-self-end px-24">
        <ul className="flex border-boulder-beige text-2xl border-4 w-max">
          <li className="h-16 w-44 transform hover:bg-boulder-beige hover:text-boulder-brown   ">
            <button className="w-full h-full font-serif">sessions</button>
          </li>

          <li className="h-16 w-44 transform hover:bg-boulder-beige hover:text-boulder-brown   ">
            <button className="w-full h-full font-serif">campaign</button>
          </li>

          <li className="h-16 w-44 transform hover:bg-boulder-beige hover:text-boulder-brown   ">
            <button className="w-full h-full font-serif">characters</button>
          </li>

          <li className="h-16 w-44 transform hover:bg-boulder-beige hover:text-boulder-brown   ">
            <button className="w-full h-full font-serif">account</button>
          </li>
        </ul>
      </div>
    </div>
  );
};

export default NavigationBar;
