import { Link, useNavigate } from "react-router-dom";
import "./index.scss";
import { BellOutlined, UserOutlined } from "@ant-design/icons";
import { useEffect, useState } from "react";
import { loadAccount } from "../../../redux/actions/accountAction";
import {
  logoutAccount,
  refreshAccount,
  refreshTokens,
} from "../../../redux/actions/authenAction";
import { useDispatch, useSelector } from "react-redux";
import {
  countNotiUnRead,
  viewNotificationDetail,
  viewNotificationUnRead,
} from "../../../redux/actions/notificationAction";

function HeaderUser() {
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.authen);
  const selectorNotification = useSelector((state) => state.notification);
  const navigate = useNavigate();
  const [account, setAccount] = useState([]);
  const [count, setCount] = useState(0);
  const [notificationUnread, setNotificationUnread] = useState([]);
  const [dropdownVisible, setDropdownVisible] = useState(false);
  const [dropdownNotificationVisible, setDropdownNotificationVisible] =
    useState(false);

  const toggleDropdown = () => {
    setDropdownVisible((prev) => !prev);
  };

  const toggleDropdownNotification = () => {
    setDropdownNotificationVisible(!dropdownNotificationVisible);
  };

  const handleLogout = async () => {
    await dispatch(
      logoutAccount({
        email: sessionStorage.getItem("email"),
      })
    );
    navigate("/");
  };

  const handleProfile = () => {
    navigate("/profile");
  };

  const handleWatchHistory = () => {
    navigate("/watch-history");
  };

  const handlePaymentHistory = () => {
    navigate("/payment-history");
  };

  const handleNotificationDetail = async (id) => {
    //Thay doi trang thai notification thanh da doc
    await viewNotificationDetail(dispatch, id);
    navigate("/notification");
  };

  const handleReceivedAt = (date) => {
    // Xử lý định dạng nếu thiếu phần mili giây
    if (typeof date === "string" && !date.includes(".")) {
      date = date + ".000";
    }

    const watchedDate = new Date(date);
    // Kiểm tra tính hợp lệ của ngày
    if (isNaN(watchedDate.getTime())) {
      return "Invalid date";
    }

    const now = new Date();
    const diffTime = now - watchedDate;
    const diffSeconds = Math.floor(diffTime / 1000);
    const diffMinutes = Math.floor(diffSeconds / 60);
    const diffHours = Math.floor(diffMinutes / 60);
    const diffDays = Math.floor(diffHours / 24);
    const diffMonths = Math.floor(diffDays / 30);
    const diffYears = Math.floor(diffDays / 365);

    if (diffSeconds < 60) {
      return `${diffSeconds} seconds ago`;
    } else if (diffMinutes < 60) {
      return `${diffMinutes} minutes ago`;
    } else if (diffHours < 24) {
      return `${diffHours} hours ago`;
    } else if (diffDays < 30) {
      return `${diffDays} days ago`;
    } else if (diffMonths < 12) {
      return `${diffMonths} months ago`;
    } else {
      return `${diffYears} years ago`;
    }
  };

  const loadUser = async (email) => {
    const response = await dispatch(loadAccount({ email }));
    setAccount(response.payload.data);
  };

  const loadNotificationUnRead = async (email, pageSize) => {
    const response = await dispatch(
      viewNotificationUnRead({
        email: email,
        pageSize: pageSize,
        id: "1000000",
      })
    );
    if (response.payload.error === true) {
      setNotificationUnread([]);
    }
    setNotificationUnread(response.payload.data);
  };

  const countNotificationUnread = async (email) => {
    const response = await dispatch(countNotiUnRead(email));
    if (response.payload.error === true) {
      setCount(0);
    }
    setCount(response.payload.data);
  };

  const handleRenewAccessToken = async (data) => {
    const response = await dispatch(refreshTokens({ email: data }));
    if (response.payload.error === true) {
      handleLogout();
    }
  };

  const handleCheckExpiredToken = async () => {
    const timeLifeToken = sessionStorage.getItem("exp");
    const currentTime = Math.floor(Date.now() / 1000); // Thời gian hiện tại (giây)
    if (timeLifeToken < currentTime) {
      await handleRenewAccessToken(sessionStorage.getItem("email"));
    }
  };

  useEffect(() => {
    if (selector.account.auth === false) {
      refreshAccount(dispatch);
    }

    if (sessionStorage.getItem("email") != null) {
      loadUser(sessionStorage.getItem("email"));
      loadNotificationUnRead(sessionStorage.getItem("email"), 5);
      handleCheckExpiredToken(); //Check het han token
      countNotificationUnread(sessionStorage.getItem("email"));
    }

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, selectorNotification.isChange]);
  return (
    <div className="header">
      <div className="header__logo">
        <Link to="/">
          <img
            src="https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526"
            alt=""
            width={100}
          />
        </Link>
      </div>
      <nav className="header__nav">
        <ul>
          <li>
            <Link to="/" className="word">
              Home
            </Link>
          </li>
          <li>
            <Link to="/movie-list" className="word">
              Movie
            </Link>
          </li>

          {selector.account.auth === true && (
            <li>
              <Link to="/wish-list" className="word">
                Wish list
              </Link>
            </li>
          )}

          <li>
            <Link to="/servicePackage" className="word">
              Service Package
            </Link>
          </li>
          <li>
            <Link to="/contact" className="word">
              Contact
            </Link>
          </li>
          <li>
            <Link to="/policies" className="word">
              Policies
            </Link>
          </li>
          {selector.account.auth === true && (
            <li>
              <div className="notification-container">
                <div className="bell-icon" onClick={toggleDropdownNotification}>
                  <BellOutlined />
                  <span className="notification-counter">{count}</span>
                </div>
                {dropdownNotificationVisible && (
                  <div className="dropdown-notification">
                    {notificationUnread.map((item, index) => (
                      <div
                        className="notification-item"
                        key={index}
                        onClick={() => {
                          handleNotificationDetail(item.notificationId);
                        }}
                      >
                        <p>
                          <strong>{item.title}</strong>
                        </p>
                        <span>{handleReceivedAt(item.createdAt)}</span>
                      </div>
                    ))}
                    <div
                      to="/notification"
                      className="view-all"
                      onClick={() => handleNotificationDetail(0)}
                      style={{ cursor: "pointer" }}
                    >
                      View All Notifications
                    </div>
                  </div>
                )}
              </div>
            </li>
          )}
          <li>
            {selector.account.auth === true ? (
              <div className="user">
                <div className="user-menu">
                  <button className="user-icon" onClick={toggleDropdown}>
                    <img
                      src={
                        account.profilePicture !== null
                          ? account.profilePicture
                          : "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-8.jpg"
                      }
                      className="image"
                    />
                  </button>
                  {dropdownVisible && (
                    <div className="dropdown">
                      <button onClick={handleProfile}>Profile</button>
                      <button onClick={handleWatchHistory}>History</button>
                      <button onClick={handlePaymentHistory}>
                        Transaction
                      </button>
                      <button onClick={handleLogout}>Logout</button>
                    </div>
                  )}
                </div>
              </div>
            ) : (
              <Link to="/login" className="word">
                <UserOutlined />
              </Link>
            )}
          </li>
        </ul>
      </nav>
    </div>
  );
}

export default HeaderUser;
