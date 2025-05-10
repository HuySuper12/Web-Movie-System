import { useEffect, useRef, useState } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import {
  updateNotificationUser,
  viewNotificationById,
  viewNotificationDetail,
  viewUserNotification,
} from "../../redux/actions/notificationAction";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { debounce } from "lodash";

function Notification() {
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.notification);
  const navigate = useNavigate();
  const [notification, setNotification] = useState([]);
  const [notificationDetail, setNotificationDetail] = useState([]);

  const [lastNotification, setLastNotification] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const sidebarRef = useRef(null);
  const pageSize = 10; // Số bản ghi mỗi trang

  const loadNotification = async (email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);
    if (lastNotification === "") {
      if (selector.lastNotificationId !== 0 && lastNotification === "") {
        setLastNotification(selector.lastNotificationId);
        setNotification(selector.notification);
      } else {
        const response = await dispatch(
          viewUserNotification({
            email: email,
            pageSize: pageSize,
            id: "1000000000",
          })
        );
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }
        setLastNotification(
          response.payload.data[response.payload.data.length - 1].notificationId
        );
        setNotification(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewUserNotification({
          email: email,
          pageSize: pageSize,
          id: lastNotification,
        })
      );

      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }
      setLastNotification(
        response.payload.data[response.payload.data.length - 1].notificationId
      );
      setNotification((pre) => [...pre, ...response.payload.data]);
    }
    setLoading(false);
  };

  const handleViewNotificationDetail = async (id) => {
    await viewNotificationDetail(dispatch, id);
  };

  const loadNotificationById = async (id) => {
    //Cap nhat chuong do update nam long va header load truoc nen chua cap nhat du lieu moi nhat
    //Can load lai trang de lay du lieu moi nhat bang 1 state (Khi update state se doi -> Load lai trang)
    const responsePrevious = await dispatch(viewNotificationById(id));
    if (responsePrevious.payload.data.status == false) {
      await dispatch(updateNotificationUser(id));
    }

    const responseNext = await dispatch(viewNotificationById(id));
    setNotificationDetail(responseNext.payload.data);
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

  //Dung custome sidebar scroll
  const handleScroll = debounce(async () => {
    if (!sidebarRef.current) return;

    const { scrollTop, scrollHeight, clientHeight } = sidebarRef.current;

    // Kiểm tra nếu cuộn gần cuối (cách đáy 50px)
    if (scrollTop + clientHeight >= scrollHeight - 50 && !loading) {
      await loadNotification(sessionStorage.getItem("email"), pageSize);
    }
  }, 500);

  useEffect(() => {
    if (sessionStorage.getItem("email") == null) {
      navigate("/login");
    }
    if (notification.length === 0) {
      loadNotification(sessionStorage.getItem("email"), pageSize);
    }
    if (selector.notificationId !== 0) {
      loadNotificationById(selector.notificationId);
    }

    //Dung custome sidebar scroll
    const sidebar = sidebarRef.current;
    if (sidebar) sidebar.addEventListener("scroll", handleScroll);
    return () => sidebar?.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, lastNotification]);

  return (
    <>
      <HeaderUser />
      <div className="messenger-style-notification">
        <div className="notification-sidebar" ref={sidebarRef}>
          <h2 className="sidebar-title">Notifications</h2>
          <ul className="notification-list">
            {notification.map((item, index) => (
              <li
                className={
                  selector.notificationId == item.notificationId
                    ? "notification-item active"
                    : "notification-item"
                }
                onClick={() =>
                  handleViewNotificationDetail(item.notificationId)
                }
                key={index}
              >
                <div
                  className={
                    item.status == false
                      ? "notification-content-unread"
                      : "notification-content"
                  }
                >
                  <h4>{item.title}</h4>
                  <p>{handleReceivedAt(item.createdAt)}</p>
                </div>
              </li>
            ))}
            {window.innerHeight + window.scrollY >=
            document.body.offsetHeight - 500
              ? hasMore && (
                  <div className="loading-container">
                    <div className="spinner"></div>
                    <p className="loading-text">Please wait...</p>
                  </div>
                )
              : null}
          </ul>
        </div>
        {selector.notificationId !== 0 && (
          <div className="notification-detail">
            <div>
              <h2 className="detail-title">{notificationDetail.title}</h2>
              <p className="detail-time">
                Received: {handleReceivedAt(notificationDetail.createdAt)}
              </p>
            </div>
            <div
              className="detail-content"
              dangerouslySetInnerHTML={{ __html: notificationDetail.content }} //Giup hien thi thong bao dang html
            ></div>
            <div className="detail-actions">
              <button
                className="btn-back"
                onClick={() => handleViewNotificationDetail(0)}
              >
                Back to Notification
              </button>
            </div>
          </div>
        )}
      </div>
      <Footer />
    </>
  );
}

export default Notification;
