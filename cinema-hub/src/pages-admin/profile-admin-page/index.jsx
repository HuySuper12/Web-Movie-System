import { Button, Form, Image, Input, Layout, Modal, Upload } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import {
  MenuUnfoldOutlined,
  MenuFoldOutlined,
  PlusOutlined,
} from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useForm } from "antd/es/form/Form";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  loadAccount,
  updateAccountInfo,
  viewAccountsByRoless,
} from "../../redux/actions/accountAction";
import { logoutAccount } from "../../redux/actions/authenAction";
import uploadFile from "../../utils/upload";
import { totalRevenue } from "../../redux/actions/paymentAction";
import { viewMovieTitle } from "../../redux/actions/movieAction";
import { accountChange } from "../../redux/reducers/accountSlice";

const { Sider, Header, Content } = Layout;
function ProfileAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.account);

  const [open, setOpen] = useState(false);
  const [openLogout, setOpenLogout] = useState(false);
  const [formVariable] = useForm();

  const [previewOpen, setPreviewOpen] = useState(false);
  const [previewImage, setPreviewImage] = useState("");
  const [fileList, setFileList] = useState([]);

  const [account, setAccount] = useState([]);
  const [movie, setMovie] = useState([]);
  const [userList, setUserList] = useState([]);
  const [staffList, setStaffList] = useState([]);
  const [revenue, setRevenue] = useState(0);

  const handleLogoutAccount = async () => {
    navigate("/");
    await dispatch(logoutAccount({ email: sessionStorage.getItem("email") }));
    localStorage.removeItem("key");
  };

  const handleEditAdmin = () => {
    setOpen(!open);
    formVariable.setFieldsValue({
      fullName: account.fullName,
      phoneNumber: account.phoneNumber,
    });
  };

  const handleSubmit = async () => {
    formVariable.submit();
  };

  const handleFinishForm = async (values) => {
    let url = account.profilePicture;
    if (fileList.length !== 0) {
      url = await uploadFile(fileList[0].originFileObj); // Chọn file đầu tiên
    }

    if (
      values.fullName === account.fullName &&
      values.phoneNumber === account.phoneNumber &&
      url === account.profilePicture
    ) {
      toast.error("Nothing change");
      return;
    }

    const data = {
      email: account.email,
      fullName: values.fullName,
      phoneNumber: values.phoneNumber,
      pictureUrl: url,
    };

    const response = await dispatch(updateAccountInfo(data));
    if (response.payload.error) {
      toast.error("Update failed");
    } else {
      dispatch(accountChange());
      toast.success("Update successfully");
      setOpen(!open);
      loadAccountProfile(sessionStorage.getItem("email"));
      formVariable.resetFields();
      setFileList([]);
    }
  };

  const loadAccountProfile = async (email) => {
    const response = await dispatch(loadAccount({ email }));
    setAccount(response.payload.data);
  };

  const loadUser = async () => {
    const response = await dispatch(viewAccountsByRoless({ role: "user" }));
    setUserList(response.payload.data);
  };

  const loadStaff = async () => {
    const response = await dispatch(viewAccountsByRoless({ role: "staff" }));
    setStaffList(response.payload.data);
  };

  const loadRevenue = async () => {
    const response = await dispatch(totalRevenue());
    setRevenue(response.payload);
  };

  const viewMovieTitles = async () => {
    const response = await dispatch(viewMovieTitle());
    setMovie(response.payload.data);
  };

  //Format Number
  const formatNumber = (number) => {
    return number.toLocaleString("en-US");
  };

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }
    loadAccountProfile(sessionStorage.getItem("email"));
    viewMovieTitles();
    loadUser();
    loadStaff();
    if (sessionStorage.getItem("role") == "Manager") loadRevenue();
    window.scroll(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange]);

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
    <button
      style={{
        border: 0,
        background: "none",
      }}
      type="button"
    >
      <PlusOutlined />
      <div
        style={{
          marginTop: 8,
        }}
      >
        Upload
      </div>
    </button>
  );

  return (
    <Layout>
      <Sider
        theme="light"
        trigger={null}
        collapsible
        collapsed={collapsed}
        className="sider"
      >
        <SideBarAdmin />

        <Button
          type="text"
          icon={collapsed ? <MenuUnfoldOutlined /> : <MenuFoldOutlined />}
          onClick={() => setCollapsed(!collapsed)}
          className="trigger-btn"
        />
      </Sider>
      <Layout>
        <Header className="headers">
          <HeaderAdmin />
        </Header>
        <Content className="content">
          <div className="admin-profile-container">
            {/* Header */}
            {sessionStorage.getItem("role") === "Staff" ? (
              <div className="admin-header">
                <h1>Admin Profile</h1>
                <p>Welcome back, Administrator!</p>
              </div>
            ) : (
              <div className="admin-header">
                <h1>Manager Profile</h1>
                <p>Welcome back, Manager!</p>
              </div>
            )}
            {/* Profile Card */}
            <div className="profile-card">
              <div className="profile-image">
                <img
                  src={account.profilePicture} // Thay bằng URL ảnh của admin
                  alt="Admin Avatar"
                />
              </div>
              <div className="profile-infos">
                <h2>{account.fullName}</h2>
                <p className="profile-role">
                  {sessionStorage.getItem("role") == "Staff"
                    ? "System Administrator"
                    : "System Manager"}
                </p>
                <p>Email: {account.email}</p>
                <p>Phone: {account.phoneNumber}</p>
              </div>
            </div>

            {/* Actions */}
            <div className="profile-actions">
              <button className="btn edit-profile" onClick={handleEditAdmin}>
                Edit Profile
              </button>
              <button
                className="btn logout"
                onClick={() => setOpenLogout(!openLogout)}
              >
                Logout
              </button>
            </div>

            {/* Statistics */}
            <div className="statistics">
              <div className="stat-card">
                <h3>Users Managed</h3>
                <p>{userList.length}</p>
              </div>
              {sessionStorage.getItem("role") === "Manager" && (
                <div className="stat-card">
                  <h3>Staffs Managed</h3>
                  <p>{staffList.length}</p>
                </div>
              )}
              <div className="stat-card">
                <h3>Movie Quantities</h3>
                <p>{movie.length}</p>
              </div>
              {sessionStorage.getItem("role") === "Manager" && (
                <div className="stat-card">
                  <h3>Revenue (VND)</h3>
                  <p>{formatNumber(revenue)} </p>
                </div>
              )}
            </div>
          </div>
        </Content>
      </Layout>
      <Modal
        title="Edit Account"
        open={open}
        onOk={handleSubmit}
        onCancel={handleEditAdmin}
        okButtonProps={{
          style: {
            backgroundColor: "#536d79",
            borderColor: "#536d79",
            color: "#fff",
          }, // Thay đổi màu nút Ok
        }}
        cancelButtonProps={{
          style: {
            color: "#5a6c76", // Màu chữ nút Cancel giống Ok
            borderColor: "#5a6c76", // Màu viền giống Ok
          },
        }}
      >
        <Form
          form={formVariable}
          labelCol={{ span: 24 }}
          onFinish={handleFinishForm}
        >
          <Form.Item
            label="Full Name"
            name="fullName"
            rules={[
              { required: true, message: "Please input your full name!" },
            ]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            label="Phone Number"
            name="phoneNumber"
            rules={[
              { required: true, message: "Please input your phone number!" },
            ]}
          >
            <Input />
          </Form.Item>
          <Form.Item label="Image Profile" name="pictureUrl">
            <Upload
              action="https://660d2bd96ddfa2943b33731c.mockapi.io/api/upload"
              listType="picture-circle"
              fileList={fileList}
              onPreview={handlePreview}
              onChange={handleChange}
            >
              {fileList.length >= 8 ? null : uploadButton}
            </Upload>
          </Form.Item>
        </Form>
      </Modal>
      <Modal
        title="Logout Account"
        open={openLogout}
        onOk={handleLogoutAccount}
        onCancel={() => setOpenLogout(!openLogout)}
        okButtonProps={{
          style: {
            backgroundColor: "#536d79",
            borderColor: "#536d79",
            color: "#fff",
          }, // Thay đổi màu nút Ok
        }}
        cancelButtonProps={{
          style: {
            color: "#5a6c76", // Màu chữ nút Cancel giống Ok
            borderColor: "#5a6c76", // Màu viền giống Ok
          },
        }}
      >
        <p>Are you really to logout your account???</p>
      </Modal>
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
    </Layout>
  );
}

export default ProfileAdmin;
