import { createBrowserRouter } from "react-router-dom";
const router = createBrowserRouter([
  {
    path: "/",
    element: <div>hello monsoir dicky</div>,
  },
  {
    path: "/login",
    element: (
      <div className="text-red-700 text-5xl">
        login plz ty 4 credit card details
      </div>
    ),
  },
]);

export default router;
