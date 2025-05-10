import { createRoot } from "react-dom/client";
import "./index.css";
import AppRoute from "./routes/AppRoute.jsx";
import { Provider } from "react-redux";
import store from "./redux/store.js";
import { GoogleOAuthProvider } from "@react-oauth/google";

createRoot(document.getElementById("root")).render(
  <Provider store={store}>
    <GoogleOAuthProvider clientId="776944879482-3ia46i8tb4gu0nlk3ulv7grvmvrksrnp.apps.googleusercontent.com">
      <AppRoute />
    </GoogleOAuthProvider>
  </Provider>
);
