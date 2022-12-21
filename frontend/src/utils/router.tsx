import { createBrowserRouter } from "react-router-dom";
import NavigationBar from "../components/NavigationBar";
import Home from "../routes/home";
import Login from "../routes/login";
const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "/login",
    element: <Login />,
  },
]);

export default router;
