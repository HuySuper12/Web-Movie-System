import { Link, useNavigate } from "react-router-dom";
import "./index.scss";
import "react-toastify/dist/ReactToastify.css";
import HeaderUser from "../../components/header/header-user";
import Footer from "../../components/footer";
import { useEffect, useState } from "react";
import { registerAccount } from "../../redux/actions/authenAction";
import { Bounce, toast, ToastContainer } from "react-toastify";
import { useDispatch } from "react-redux";

const Register = () => {
  const [email, setEmail] = useState("");
  const [fullName, setFullName] = useState("");
  const [phone, setPhone] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const navigate = useNavigate();
  const dispatch = useDispatch();

  const handleRegister = async () => {
    const data = {
      fullName: fullName,
      email:
        localStorage.getItem("email") !== null
          ? localStorage.getItem("email")
          : email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    };

    const response = await dispatch(registerAccount(data));
    localStorage.removeItem("email");

    if (response.payload.error !== undefined) {
      if (response.payload.error.message !== undefined) {
        toast.error(response.payload.error.message);
      } else {
        if (response.payload.error.errors.Email !== undefined) {
          toast.error(response.payload.error.errors.Email[0]);
          return;
        } else if (response.payload.error.errors.Phone !== undefined) {
          toast.error(response.payload.error.errors.Phone[0]);
          return;
        } else if (response.payload.error.errors.Password !== undefined) {
          toast.error(response.payload.error.errors.Password[0]);
          return;
        }
      }
    } else {
      if (response.payload.data.success === true) {
        navigate("/login");
        return;
      }
    }
  };

  const handlePressEnter = (event) => {
    if (event && event.key == "Enter") {
      handleRegister();
    }
  };

  useEffect(() => {
    if (localStorage.getItem("email") !== null) {
      setEmail(localStorage.getItem("email")); //Tu dong dien email
      localStorage.removeItem("email");
    }
  }, []);

  return (
    <>
      <HeaderUser />
      <div className="register-container">
        <div className="register-background">
          <div className="register-box">
            <h2>SIGN UP</h2>
            {/* Email */}
            <div className="input-group">
              <input
                type="email"
                name="email"
                placeholder="Email"
                defaultValue={email}
                onChange={(event) => setEmail(event.target.value)}
              />
            </div>
            {/* Full Name */}
            <div className="input-group">
              <input
                type="text"
                name="fullName"
                placeholder="Full Name"
                onChange={(event) => setFullName(event.target.value)}
              />
            </div>
            {/* Phone */}
            <div className="input-group">
              <input
                type="tel"
                name="phone"
                placeholder="Phone Number"
                onChange={(event) => setPhone(event.target.value)}
              />
            </div>
            {/* Password */}
            <div className="input-group">
              <input
                type="password"
                name="password"
                placeholder="Password"
                onChange={(event) => setPassword(event.target.value)}
              />
            </div>
            {/* Confirm Password */}
            <div className="input-group">
              <input
                type="password"
                name="confirmPassword"
                placeholder="Confirm Password"
                onChange={(event) => setConfirmPassword(event.target.value)}
                onKeyPress={(event) => handlePressEnter(event)} //Khi nhan Enter thi goi ham handleLogin
              />
            </div>
            {/* Register Button */}
            <button className="btn-register" onClick={handleRegister}>
              Register
            </button>
            <div className="divider">
              Already have an account? <Link to="/login">Login</Link>
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

export default Register;
