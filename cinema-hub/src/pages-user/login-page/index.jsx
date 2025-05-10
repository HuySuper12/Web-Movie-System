import { Link, useNavigate } from "react-router-dom";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  loginAccount,
  loginGoogleAccount,
} from "../../redux/actions/authenAction";
import { FaEye, FaEyeSlash } from "react-icons/fa";
import { GoogleLogin } from "@react-oauth/google";

const Login = () => {
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.movie);
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [showPassword, setShowPassword] = useState(false);

  const account = {
    email:
      localStorage.getItem("email") !== null
        ? localStorage.getItem("email")
        : email,
    password: password,
  };

  const handleLogin = async () => {
    if (account.email === "" || password === "") {
      toast.error("Please fill in all fields.");
      return;
    }

    const response = await dispatch(loginAccount(account, dispatch));

    if (response.payload.error !== undefined) {
      if (response.payload.error.message === "Your account has been banned") {
        toast.error("Your account has been banned.");
      } else if (response.payload.error.message === "Invalid password") {
        toast.error("Invalid password.");
      } else if (response.payload.error.message === "Account not found") {
        toast.error("Account not found.");
      } else if (response.payload.error.message != null) {
        toast.error(response.payload.error.errors.Email[0]);
      }
    } else {
      if (
        sessionStorage.getItem("role") === "Staff" ||
        sessionStorage.getItem("role") === "Manager"
      ) {
        navigate("/admin");
      } else {
        if (selector.movieDetail === 0) {
          navigate("/");
        } else {
          navigate("/movie-detail");
        }
      }
    }
  };

  const handlePressEnter = (event) => {
    if (event && event.key == "Enter") {
      handleLogin();
    }
  };

  const handleLoginGoogle = async (token) => {
    const response = await dispatch(loginGoogleAccount(token, dispatch));
    if (response.payload.error !== undefined) {
      if (response.payload.error.message === "Your account has been banned") {
        toast.error("Your account has been banned.");
      } else if (response.payload.error.message === "Invalid password") {
        toast.error("Invalid password.");
      } else if (response.payload.error.message === "Account not found") {
        toast.error("Account not found.");
      } else if (response.payload.error.message != null) {
        toast.error(response.payload.error.errors.Email[0]);
      }
    } else {
      navigate("/");
    }
  };

  return (
    <>
      <HeaderUser />
      <div className="login-container">
        <div className="login-background">
          <div className="login-box">
            <h2>SIGN IN</h2>
            <div className="input-group">
              <input
                type="email"
                placeholder="Input email"
                required
                defaultValue={localStorage.getItem("email")}
                onChange={(event) => setEmail(event.target.value)}
              />
            </div>
            <div className="input-group">
              <div
                onClick={() => setShowPassword(!showPassword)}
                className="show-password"
              >
                {showPassword ? <FaEyeSlash /> : <FaEye />}
              </div>
              <input
                type={showPassword ? "text" : "password"}
                placeholder="Input password"
                required
                onChange={(event) => setPassword(event.target.value)}
                onKeyPress={(event) => handlePressEnter(event)} //Khi nhan Enter thi goi ham handleLogin
                className="password-input"
              />
            </div>

            <button className="btn-login" onClick={handleLogin}>
              Login
            </button>
            <div className="divider">OR</div>
            <GoogleLogin
              onSuccess={(credentialResponse) => {
                handleLoginGoogle(credentialResponse.credential);
              }}
              onError={() => {
                console.log("Login Failed");
              }}
            />
            <div className="options">
              <div className="remember-me">
                <input type="checkbox" id="rememberMe" />
                <label htmlFor="rememberMe">Remember me</label>
              </div>
              <div>
                <Link to="/forgot-password">Forgot password?</Link>
              </div>
            </div>
            <div className="register">
              Are you a new member?
              <Link to="/register"> Sign up now.</Link>
            </div>
          </div>
        </div>
      </div>
      <Footer />
      <ToastContainer
        position="top-right"
        autoClose={5000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
        transition={Bounce}
      />
    </>
  );
};

export default Login;
