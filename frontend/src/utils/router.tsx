import { createBrowserRouter } from "react-router-dom";
import NavigationBar from "../components/NavigationBar";
const router = createBrowserRouter([
  {
    path: "/",
    element: <div>hello monsoir dicky</div>,
  },
  {
    path: "/login",
    element: (
      <NavigationBar>
        <div className="text-red-700 text-5xl">boulder.</div>
      </NavigationBar>
    ),
  },
]);

export default router;
