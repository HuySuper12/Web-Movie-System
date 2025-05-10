import { useEffect, useRef, useState } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import { useDispatch, useSelector } from "react-redux";
import {
  resetPasswordAccount,
  sendOTPAccount,
  verifyOTPAccount,
} from "../../redux/actions/accountAction";
import { Link, useNavigate } from "react-router-dom";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { accountChange } from "../../redux/reducers/accountSlice";

const ForgotPassword = () => {
  const [email, setEmail] = useState("");
  // eslint-disable-next-line no-unused-vars
  const [otp, setOtp] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [otpTemp, setOtpTemp] = useState(new Array(6).fill("")); // Mảng chứa từng số OTP
  const inputRefs = useRef([]); // Ref để điều khiển input

  const [state1, setState1] = useState(false);
  const [state2, setState2] = useState(false);

  const dispatch = useDispatch();
  const selector = useSelector((state) => state.authen);
  const navigate = useNavigate();

  const handlePressEnter = (event) => {
    if (event && event.key == "Enter") {
      handleSubmit();
    }
  };

  const handleSubmit = async (
    dispatch,
    email,
    otp,
    password,
    confirmPassword
  ) => {
    if (localStorage.getItem("otp") !== null) {
      if (password !== confirmPassword) {
        toast.error("Password and Confirm Password do not match.");
        return;
      }
      await dispatch(
        resetPasswordAccount({ email: email, newPassword: password })
      ); //reset password
      navigate("/login");
    } else {
      await dispatch(sendOTPAccount(email)); //send OTP to email
      setState1(true);
      dispatch(accountChange());
    }
  };

  const handleChange = async (index, value) => {
    if (!/^\d*$/.test(value)) return; // Chỉ nhận số
    const newOtp = [...otpTemp];
    newOtp[index] = value.slice(-1); // Chỉ lấy số cuối cùng

    setOtpTemp(newOtp);

    // Chuyển con trỏ sang ô tiếp theo nếu chưa đến ô cuối
    if (value && index < newOtp.length - 1) {
      setTimeout(() => inputRefs.current[index + 1]?.focus(), 10);
    }

    if (newOtp.join("").length === 6) {
      const response = await dispatch(
        verifyOTPAccount({ email: email, otp: newOtp.join("") })
      );
      //verify OTP
      if (response.payload.success === false) {
        toast.error("Invalid OTP code.");
        localStorage.removeItem("email");
        localStorage.removeItem("otp");
        setState1(false);
        return;
      }
      inputRefs.current[index]?.blur(); // Mất focus khỏi ô nhập
      setState2(true);
      dispatch(accountChange());
    }
  };

  const handleKeyDown = (index, e) => {
    if (e.key === "Backspace" && !otp[index] && index > 0) {
      inputRefs.current[index - 1]?.focus(); // Quay lại ô trước khi bấm xóa
    }
  };

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [selector.isChange]);

  return (
    <>
      <HeaderUser />
      <div className="forgot-password-page">
        <div className="forgot-password-background">
          <div className="forgot-password-container">
            <h2>FORGOT PASSWORD</h2>
            <p>Please enter your email address to reset your password.</p>
            <input
              type="email"
              placeholder="Email Address"
              required
              onChange={(event) => setEmail(event.target.value)}
              className={state1 === true ? "non-interactable" : ""}
            />
            {state1 === true && (
              <>
                <p>Please enter your OTP to reset your password.</p>
                <div className="otp-container">
                  {otpTemp.map((digit, index) => (
                    <input
                      key={index}
                      ref={(el) => (inputRefs.current[index] = el)}
                      type="text"
                      maxLength="1"
                      value={digit}
                      onChange={(e) => handleChange(index, e.target.value)}
                      onKeyDown={
                        state2 === true ? null : (e) => handleKeyDown(index, e)
                      }
                      className={
                        state2 === true ? "non-interactable-otp" : "otp-input"
                      }
                    />
                  ))}
                </div>
              </>
            )}

            {state2 === true && (
              <>
                <p>
                  Please enter your new password and confirm password to reset
                  your password.
                </p>
                <input
                  type="password"
                  placeholder="Password"
                  required
                  onChange={(event) => setPassword(event.target.value)}
                />
                <input
                  type="password"
                  placeholder="Confirm Password"
                  required
                  onChange={(event) => setConfirmPassword(event.target.value)}
                  onKeyPress={(event) => handlePressEnter(event)}
                />
              </>
            )}
            <button
              onClick={() =>
                handleSubmit(dispatch, email, otp, password, confirmPassword)
              }
            >
              Submit
            </button>
            <div>
              <Link to="/login" className="login-link">
                Back to Login
              </Link>
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

export default ForgotPassword;
