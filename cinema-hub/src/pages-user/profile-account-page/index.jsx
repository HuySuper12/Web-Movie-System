import { useEffect, useState } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import "react-toastify/dist/ReactToastify.css";
import { useNavigate } from "react-router-dom";
import {
  loadAccount,
  updateAccountInfo,
} from "../../redux/actions/accountAction";
import { Bounce, toast, ToastContainer } from "react-toastify";
import { Image, Upload } from "antd";
import { PlusOutlined } from "@ant-design/icons";
import uploadFile from "../../utils/upload";
import { useDispatch } from "react-redux";
import {
  loadMovieInHistory,
  loadWatchHistory,
} from "../../redux/actions/watchHistoryAction";
import { viewPaymentRemaining } from "../../redux/actions/paymentAction";

const ProfilePage = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [account, setAccount] = useState([]);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [name, setName] = useState("");
  const [phone, setPhone] = useState("");
  const [previewOpen, setPreviewOpen] = useState(false);
  const [previewImage, setPreviewImage] = useState("");
  const [fileList, setFileList] = useState([]);
  const [moviesHistory, setMoviesHistory] = useState([]);
  const [history, setHistory] = useState([]);
  const [paidSubscription, setPaidSubscription] = useState();

  //Mo modal
  const toggleModal = () => {
    setIsModalOpen(!isModalOpen);
  };

  //Load account
  const loadUser = async (email) => {
    const response = await dispatch(loadAccount({ email }));
    setAccount(response.payload.data);
  };

  //Upload file img
  const getBase64 = (file) =>
    new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result);
      reader.onerror = (error) => reject(error);
    });

  const handlePreview = async (file) => {
    if (!file.url && !file.preview) {
      file.preview = await getBase64(file.originFileObj);
    }
    setPreviewImage(file.url || file.preview);
    setPreviewOpen(true);
  };
  const handleChange = ({ fileList: newFileList }) => setFileList(newFileList);
  const uploadButton = (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        height: "0vh", // Đảm bảo chiều cao container đủ để căn giữa
        backgroundColor: "#f0f0f0", // Màu nền tùy chỉnh để dễ quan sát
      }}
    >
      <button
        style={{
          border: 0,
          background: "white",
          marginTop: 0, // Điều chỉnh khoảng cách giữa nút và text
          padding: 30,
          borderRadius: 55,
          boxShadow: "0px 4px 6px rgba(0, 0, 0, 0.1)", // Tạo hiệu ứng nổi cho nút
          cursor: "pointer", // Đổi con trỏ khi di chuột qua nút
        }}
        type="button"
      >
        <PlusOutlined />
        <div
          style={{
            marginTop: 8, // Điều chỉnh khoảng cách giữa icon và text
            fontSize: "14px", // Tăng kích thước chữ nếu cần
          }}
        >
          Upload
        </div>
      </button>
    </div>
  );

  const handleUpdateAccount = async () => {
    // 1. Upload file ảnh
    let url = account.profilePicture;
    if (fileList.length !== 0) {
      url = await uploadFile(fileList[0].originFileObj); // Chọn file đầu tiên
    }

    // Sử dụng biến tạm thay vì chờ state cập nhật
    const updatedName = name === "" ? account.fullName : name;
    const updatedPhone = phone === "" ? account.phoneNumber : phone;

    // 2. Chuẩn bị dữ liệu để update
    const dataUpload = {
      email: account.email,
      fullName: updatedName,
      phoneNumber: updatedPhone,
      pictureUrl: url,
    };

    // 3. Kiểm tra thông tin có thay đổi không
    if (
      dataUpload.fullName === account.fullName &&
      dataUpload.phoneNumber === account.phoneNumber &&
      dataUpload.pictureUrl === account.profilePicture
    ) {
      toast.error("Update information failed: No changes detected.");
      return;
    }

    // 4. Gửi API cập nhật thông tin
    await dispatch(updateAccountInfo(dataUpload));
    // 5. Reset file list, thông báo thành công và tải lại thông tin người dùng
    setFileList([]); // Reset file ảnh
    toast.success("Update information successfully");
    loadUser(account.email); // Load lại thông tin user
    toggleModal(); // Đóng modal
    navigate("/profile");
  };

  const fetchWatchHistory = async (email, pageSize) => {
    const response = await dispatch(
      loadWatchHistory({ email: email, pageSize: pageSize, id: "1000000000" })
    );
    setHistory(response.payload.data);
  };

  const fetchMovieInHistory = async (email, pageSize) => {
    const response = await dispatch(
      loadMovieInHistory({ email: email, pageSize: pageSize, id: "1000000000" })
    );
    setMoviesHistory(response.payload.data);
  };
  const handleWatchAt = (date) => {
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

  const handleWatchHistory = () => {
    navigate("/watch-history");
  };

  //load goi dich vu
  const loadPaidSubscription = async (email) => {
    const response = await dispatch(viewPaymentRemaining({ email: email }));
    setPaidSubscription(response.payload.data);
  };

  useEffect(() => {
    if (sessionStorage.getItem("email") !== null) {
      loadUser(sessionStorage.getItem("email"));
      fetchWatchHistory(sessionStorage.getItem("email"), 3);
      fetchMovieInHistory(sessionStorage.getItem("email"), 3);
      loadPaidSubscription(sessionStorage.getItem("email"));
    } else {
      navigate("/login");
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
  return (
    <>
      <HeaderUser />
      <div className="profile-container">
        {/* Profile Header */}
        <div className="profile-header">
          <img
            src={
              account.profilePicture === null
                ? "https://phongreviews.com/wp-content/uploads/2022/11/avatar-facebook-mac-dinh-8.jpg"
                : account.profilePicture
            }
            alt="Avatar"
            className="profile-avatar"
          />
          <h1 className="profile-name">{account.fullName}</h1>
          <p className="profile-email">{account.email}</p>
        </div>

        {/* Profile Info */}
        <div className="profile-info">
          <h2 className="section-title">PERSONAL INFORMATION</h2>
          <ul>
            <li>
              <strong>Email:</strong> {account.email}
            </li>
            <li>
              <strong>Phone:</strong> {account.phoneNumber}
            </li>
            <li>
              <strong>Service Package:</strong>{" "}
              {paidSubscription && paidSubscription.subscriptionPlan
                ? paidSubscription.subscriptionPlan.planName
                : "Guest"}
            </li>
          </ul>
        </div>
        {/* Edit Button */}
        <button className="edit-button" onClick={toggleModal}>
          Edit Profile
        </button>

        {/* Watch History */}
        <div className="watch-history">
          {moviesHistory !== undefined && (
            <h2 className="section-title">WATCH HISTORY</h2>
          )}
          <div className="movie-lists">
            {moviesHistory !== undefined &&
              moviesHistory.map((movie, historyId) => (
                <div key={historyId} className="movie-cards">
                  <img
                    src={movie.thumbnail}
                    alt={movie.title}
                    className="movie-posters"
                  />
                  <h3 className="movie-titles">{movie.title}</h3>
                  <p>
                    <strong>Director:</strong> {movie.director}
                  </p>
                  <p>
                    <strong>Views:</strong>{" "}
                    {moviesHistory[historyId].watchHistories.length} view(s)
                  </p>
                  <p>
                    <strong>Last Watched:</strong>{" "}
                    {handleWatchAt(
                      history?.[historyId]?.watchedAt || "Chưa xem"
                    )}
                  </p>
                </div>
              ))}
          </div>
        </div>

        {moviesHistory !== undefined && (
          <button className="history-button" onClick={handleWatchHistory}>
            Movie History
          </button>
        )}

        {/* Modal Pop-Up */}
        {isModalOpen && (
          <div className="modal-overlay" onClick={toggleModal}>
            <div className="modal-content" onClick={(e) => e.stopPropagation()}>
              <h2>EDIT PROFILE</h2>
              <div className="container-edit">
                <div className="load-avatar">
                  <Upload
                    action="https://660d2bd96ddfa2943b33731c.mockapi.io/api/upload"
                    listType="picture-circle"
                    fileList={fileList}
                    onPreview={handlePreview}
                    onChange={handleChange}
                  >
                    {fileList.length >= 1 ? null : uploadButton}
                  </Upload>
                </div>
                <div>
                  <div className="form-group">
                    <label htmlFor="name">Name:</label>
                    <input
                      type="text"
                      id="name"
                      defaultValue={account.fullName}
                      onChange={(event) => setName(event.target.value)}
                    />
                  </div>
                  <div className="form-group">
                    <label htmlFor="phone">Phone:</label>
                    <input
                      type="text"
                      id="phone"
                      defaultValue={account.phoneNumber}
                      onChange={(event) => setPhone(event.target.value)}
                    />
                  </div>
                </div>
              </div>
              <div className="button-container">
                <button className="save-button" onClick={handleUpdateAccount}>
                  Save
                </button>
                <button className="close-button" onClick={toggleModal}>
                  Close
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
      <Footer />
      {previewImage && (
        <Image
          wrapperStyle={{
            display: "none",
          }}
          preview={{
            visible: previewOpen,
            onVisibleChange: (visible) => setPreviewOpen(visible),
            afterOpenChange: (visible) => !visible && setPreviewImage(""),
          }}
          src={previewImage}
        />
      )}
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

export default ProfilePage;
