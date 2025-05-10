import {
  Button,
  Image,
  Input,
  Layout,
  Space,
  Table,
  Tabs,
  Modal,
  Form,
  Upload,
} from "antd";
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
import TabPane from "antd/es/tabs/TabPane";
import { useForm } from "antd/es/form/Form";
import uploadFile from "../../utils/upload";
import {
  disableAccount,
  loadAccount,
  updateAccountInfo,
  viewAccountsByRoleDetail,
} from "../../redux/actions/accountAction";
import { registerAccountStaff } from "../../redux/actions/authenAction";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useDispatch, useSelector } from "react-redux";
import { debounce } from "lodash";
import {
  accountChange,
  accountChangeActiveTab,
} from "../../redux/reducers/accountSlice";

const { Sider, Header, Content } = Layout;
function AccountAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.account);

  const [activeTab, setActiveTab] = useState("User");
  const [open, setOpen] = useState(false);
  const [openDelete, setOpenDelete] = useState(false);
  const [formVariable] = useForm();

  const [dataSource, setDataSource] = useState([]);
  // eslint-disable-next-line no-unused-vars
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 4; // Số bản ghi mỗi trang
  const [account, setAccount] = useState({});

  const [previewOpen, setPreviewOpen] = useState(false);
  const [previewImage, setPreviewImage] = useState("");
  const [fileList, setFileList] = useState([]);
  const [title, setTitle] = useState("Add New Staff");

  const [lastId, setLastId] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  //Mo modal
  const handleOpenModel = (record) => {
    setTitle("Edit Account");
    setOpen(true);
    formVariable.setFieldsValue(record);
  };

  //Submit form edit account
  const handleSubmit = () => {
    formVariable.submit();
  };

  const handleFinishForm = async (values) => {
    if (title === "Add New Staff") {
      if (values.password !== values.confirmPassword) {
        toast.error("Password and Confirm Password are not the same!");
        return;
      }

      const data = {
        fullName: values.fullName,
        email: values.email,
        phone: values.phoneNumber,
        password: values.password,
        confirmPassword: values.confirmPassword,
      };

      const response = await dispatch(registerAccountStaff(data));

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
          toast.success("Add new staff successfully!");
          setOpen(!open);
          formVariable.resetFields();
          loadAccountsByRole(activeTab);
          dispatch(accountChange());
          return;
        }
      }
    } else {
      const account = await dispatch(loadAccount({ email: values.email }));

      let url = account.payload.data.profilePicture;
      if (fileList.length !== 0) {
        url = await uploadFile(fileList[0].originFileObj); // Chọn file đầu tiên
      }

      if (
        account.payload.data.fullName === values.fullName &&
        account.payload.data.phoneNumber === values.phoneNumber &&
        account.payload.data.profilePicture === url
      ) {
        toast.error("Nothing change");
        setOpen(!open);
        return;
      }

      const data = {
        email: values.email,
        fullName: values.fullName,
        phoneNumber: values.phoneNumber,
        pictureUrl: url,
      };

      const response = await dispatch(updateAccountInfo(data));
      if (response.payload.success === true) {
        dispatch(accountChange());
        toast.success("Update account successfully!");
        setOpen(!open);
        setFileList([]);
        return;
      }
    }
  };

  const handleDisableAccount = async () => {
    if (activeTab === "User" || sessionStorage.getItem("role") === "Manager") {
      const response = await dispatch(disableAccount({ email: account.email }));
      if (response.payload.error === true) {
        toast.error("Delete account failed!");
        return;
      }
      toast.success(
        account.status === true
          ? "Delete account successfully!"
          : "Enable account successfully!"
      );
      setOpenDelete(!openDelete);
      dispatch(accountChangeActiveTab(activeTab));
    } else {
      toast.error("You can't delete staff account!");
    }
  };

  //Load account
  const loadAccountsByRole = async (role, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastId === "") {
      if (
        selector.lastAccount !== 0 &&
        lastId === "" &&
        selector.activeTab === activeTab
      ) {
        setLastId(selector.lastAccount);
        setDataSource(selector.account);
      } else {
        const response = await dispatch(
          viewAccountsByRoleDetail({
            data: role,
            pageSize: pageSize,
            id: "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF", //Chuoi guid co gia tri to nhat
          })
        );
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        setLastId(response.payload.data[response.payload.data.length - 1].id);
        setDataSource(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewAccountsByRoleDetail({ data: role, pageSize: pageSize, id: lastId })
      );
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      setLastId(response.payload.data[response.payload.data.length - 1].id);
      setDataSource((pre) => [...pre, ...response.payload.data]);
    }

    setLoading(false);
  };

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await loadAccountsByRole(activeTab, pageSize);
    }
  }, 750);

  useEffect(() => {
    setLoading(false);
    setHasMore(true);
    setLastId("");
    setDataSource([]);
  }, [activeTab, selector.isChange]);

  useEffect(() => {
    if (dataSource.length === 0) loadAccountsByRole(activeTab, pageSize);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [dataSource]);

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, lastId]);

  const columns = [
    {
      title: "No",
      dataIndex: "key",
      align: "center",
      width: 70,
      render: (text, record, index) => {
        // Kiểm tra dữ liệu nếu cần thiết
        return (currentPage - 1) * pageSize + index + 1;
      }, // Tính STT, // Thêm số thứ tự
    },
    {
      title: "Picture Profile",
      dataIndex: "profilePicture",
      key: "profilePicture",
      align: "center",
      width: 200,
      render: (profilePicture) => (
        <center>
          <Image
            src={profilePicture}
            alt="profile"
            width="100px"
            height="120px"
          />
        </center>
      ),
    },
    {
      title: (
        <div style={{ textAlign: "center", width: "100%" }}>Full Name</div>
      ),
      dataIndex: "fullName",
      key: "fullName",
      align: "left",
      width: 250,
    },
    {
      title: <div style={{ textAlign: "center", width: "100%" }}>Email</div>,
      dataIndex: "email",
      key: "email",
      align: "left",
      width: 250,
    },
    {
      title: "Phone Number",
      dataIndex: "phoneNumber",
      key: "phoneNumber",
      align: "center",
      width: 200,
    },
    {
      title: "Action",
      key: "action",
      align: "center",
      render: (_, record) => (
        <Space size="middle">
          <Button type="primary" onClick={() => handleOpenModel(record)}>
            Edit
          </Button>
          {(record.status === false || activeTab === "Staff") && (
            <Button
              color="danger"
              variant="solid"
              onClick={() => {
                setAccount(record);
                setOpenDelete(!openDelete);
              }}
            >
              {record.status === false ? "Enable" : "Disable"}
            </Button>
          )}
        </Space>
      ),
    },
  ];

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
          {sessionStorage.getItem("role") === "Manager" && (
            <div className="tabs-container">
              {activeTab === "Staff" && (
                <Button
                  className="custom-button"
                  onClick={() => {
                    setOpen(!open);
                    setTitle("Add New Staff");
                    formVariable.resetFields();
                  }}
                >
                  Add New Staff
                </Button>
              )}
              <Tabs
                defaultActiveKey={activeTab}
                className="custom-tabs"
                onChange={(key) => {
                  setActiveTab(key);
                  dispatch(accountChangeActiveTab(key));
                }}
              >
                <TabPane tab="Users" key="User" />
                <TabPane tab="Staff" key="Staff" />
              </Tabs>
            </div>
          )}
          <Table
            dataSource={dataSource}
            columns={columns}
            pagination={false}
            rowKey={(record) => record.id}
          />
          <Modal
            style={{ top: 60 }} // Dịch modal lên 30px
            title={title}
            open={open}
            onOk={handleSubmit}
            onCancel={() => {
              setOpen(!open);
              setFileList([]);
            }}
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
                label="Email"
                name="email"
                rules={[
                  {
                    required: true,
                    message: "Please input your Email!",
                  },
                ]}
              >
                <Input disabled={title === "Edit Account"} />
              </Form.Item>
              <Form.Item
                label="Full Name"
                name="fullName"
                rules={[
                  { required: true, message: "Please input your Full Name!" },
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                name="phoneNumber"
                label="Phone Number"
                rules={[
                  {
                    required: true,
                    message: "Please input your Phone Number!",
                  },
                ]}
              >
                <Input />
              </Form.Item>
              {title === "Add New Staff" && (
                <>
                  <Form.Item
                    name="password"
                    label="Password"
                    rules={[
                      {
                        required: true,
                        message: "Please input your Password!",
                      },
                    ]}
                  >
                    <Input type="password" />
                  </Form.Item>
                  <Form.Item
                    name="confirmPassword"
                    label="Confirm Password"
                    rules={[
                      {
                        required: true,
                        message: "Please input your ConfirmPassword!",
                      },
                    ]}
                  >
                    <Input type="password" />
                  </Form.Item>
                </>
              )}
              {title === "Edit Account" && (
                <Form.Item label="Profile Picture" name="profilePicture">
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
              )}
            </Form>
          </Modal>
          <Modal
            title="Disable Account"
            open={openDelete}
            onOk={handleDisableAccount}
            onCancel={() => setOpenDelete(!openDelete)}
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
            <p>Are you really to disable account???</p>
          </Modal>
          {/* <div style={{ padding: "10px 0", textAlign: "center" }}>
            {window.innerHeight + window.scrollY >=
            document.body.offsetHeight - 500
              ? hasMore && (
                  <div className="loading-containers">
                    <div className="spinners"></div>
                    <p className="loading-texts">Please wait...</p>
                  </div>
                )
              : null}
          </div> */}
        </Content>
      </Layout>
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
    </Layout>
  );
}

export default AccountAdmin;
