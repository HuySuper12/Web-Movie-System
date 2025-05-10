import { Button, Form, Input, Layout, Modal, Space, Table, Tabs } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useForm } from "antd/es/form/Form";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  addSubscription,
  checkSubscription,
  removeSubscription,
  updateSubscription,
  viewAllPending,
  viewAllSubscriptionStatus,
} from "../../redux/actions/subscriptionPlanAction";
import { subscriptionReset } from "../../redux/reducers/subscriptionPlanSlice";
import TabPane from "antd/es/tabs/TabPane";

const { Sider, Header, Content } = Layout;
function SubscriptionPlanAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.subscriptionPlan);

  const [open, setOpen] = useState(false);
  const [formVariable] = useForm();
  const [title, setTitle] = useState("Add Genre");

  const [activeTab, setActiveTab] = useState("true");
  const [openDelete, setOpenDelete] = useState(false);
  const [openConfirm, setOpenConfirm] = useState(false);

  const [dataSource, setDataSource] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 8; // Số bản ghi mỗi trang

  const columns = [
    {
      title: "No",
      dataIndex: "key",
      align: "center",
      render: (text, record, index) => {
        // Kiểm tra dữ liệu nếu cần thiết
        return (currentPage - 1) * pageSize + index + 1;
      }, // Tính STT, // Thêm số thứ tự
    },
    {
      title: "Plan Name",
      dataIndex: "planName",
      key: "planName",
      align: "center",
    },
    {
      title: (
        <div style={{ textAlign: "center", width: "100%" }}>Description</div>
      ),
      dataIndex: "description",
      key: "description",
      align: "left",
    },
    {
      title: "Price",
      dataIndex: "price",
      key: "price",
      align: "center",
    },
    {
      title: "Duration",
      dataIndex: "duration",
      key: "duration",
      align: "center",
    },
    {
      title: "Create At",
      dataIndex: "createdAt",
      key: "createdAt",
      align: "center",
      render: (createdAt) => {
        return formatDate(createdAt);
      },
    },
    {
      title: "Status",
      dataIndex: "isActive",
      key: "isActive",
      align: "center",
      render: (isActive) => {
        return isActive ? "Active" : "Disable";
      },
    },
    {
      title: "Action",
      key: "action",
      align: "center",
      render: (_, record) => (
        <Space size="middle">
          <Button
            type="primary"
            onClick={() => handleEditSubscriptionPlan(record)}
          >
            Edit
          </Button>
          {activeTab === "true" || activeTab === "false" ? (
            <Button
              color="danger"
              variant="solid"
              onClick={() => {
                setOpenDelete(!openDelete);
                localStorage.setItem("subscriptionPlanId", record.planId);
                localStorage.setItem("status", record.isActive);
              }}
            >
              {activeTab == "true" ? "Delete" : "Enable"}
            </Button>
          ) : (
            <Button
              style={{
                backgroundColor: "#fff",
                borderColor: "#536d79",
                color: "#536d79",
              }}
              onClick={() => {
                setOpenConfirm(true);
                localStorage.setItem("subscriptionPlanId", record.planId);
              }}
            >
              Confirm
            </Button>
          )}
        </Space>
      ),
    },
  ];

  const handleEditSubscriptionPlan = (record) => {
    setOpen(!open);
    setTitle("Edit Subscription Plan");
    formVariable.setFieldsValue(record);
    localStorage.setItem("subscriptionPlanId", record.planId);
  };

  const handleSubmit = () => {
    formVariable.submit();
  };

  const handleFinishForm = async (values) => {
    if (title === "Add New Subscription Plan") {
      const data = {
        id: 0,
        planName: values.planName,
        description: values.description,
        price: values.price,
        duration: values.duration,
      };

      const response = await dispatch(addSubscription(data));
      if (response.payload.success == true) {
        dispatch(subscriptionReset());
        setOpen(!open);
        toast.success("Add New Subscription Plan Successfully");
      }
    } else {
      const data = {
        id: localStorage.getItem("subscriptionPlanId"),
        planName: values.planName,
        description: values.description,
        price: values.price,
        duration: values.duration,
      };
      const response = await dispatch(updateSubscription(data));
      if (response.payload.success == true) {
        dispatch(subscriptionReset());
        setOpen(!open);
        toast.success("Edit Subscription Plan Successfully");
      } else {
        toast.error("Nothing change");
        setOpen(!open);
      }
    }
  };

  const handleDelete = async () => {
    const response = await dispatch(
      removeSubscription({ id: localStorage.getItem("subscriptionPlanId") })
    );
    if (response.payload.success == true) {
      toast.success(
        localStorage.getItem("status") == "true"
          ? "Delete Subscription Plan Successfully"
          : "Enable Subscription Plan Successfully"
      );
      dispatch(subscriptionReset());
      localStorage.removeItem("subscriptionPlanId");
      setOpenDelete(!openDelete);
    }
  };

  const handleCheckSubscriptionPlan = async (status) => {
    const subscriptionPlanId = localStorage.getItem("subscriptionPlanId");
    const response = await dispatch(
      checkSubscription({ id: subscriptionPlanId, status: status })
    );

    if (response.payload.success == true) {
      dispatch(subscriptionReset());
      toast.success("Check subscription plan successfully");
      setOpenConfirm(!openConfirm);
      localStorage.removeItem("subscriptionPlanId");
    } else {
      toast.error("Check subscription plan failed");
    }
  };

  //Format Date
  const formatDate = (createdAt) => {
    if (!createdAt) return "Unknown Date"; // Nếu không có giá trị, trả về chuỗi mặc định
    const date = new Date(createdAt);
    const formatTwoDigits = (num) => String(num).padStart(2, "0");
    return `${formatTwoDigits(date.getDate())}/${formatTwoDigits(
      date.getMonth() + 1
    )}/${date.getFullYear()} ${formatTwoDigits(
      date.getHours()
    )}:${formatTwoDigits(date.getMinutes())}`; // Ngày/Tháng/Năm Giờ:Phút:Giây
  };

  const loadSubscriptionPlan = async (status) => {
    if (selector.subscriptionPlan.length > 0 && dataSource.length !== 0) {
      dataSource(selector.subscriptionPlan);
      return;
    }
    const response = await dispatch(
      viewAllSubscriptionStatus({ status: status })
    );
    setDataSource(response.payload.data);
  };

  const loadSubscriptionPlanPending = async () => {
    if (selector.subscriptionPlan.length > 0 && dataSource.length !== 0) {
      setDataSource(selector.subscriptionPlan);
      return;
    }
    const response = await dispatch(viewAllPending());
    setDataSource(response.payload.data);
  };

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }
    if (activeTab === "true") {
      loadSubscriptionPlan(activeTab);
    } else if (activeTab === "false") {
      loadSubscriptionPlan(activeTab);
    } else {
      loadSubscriptionPlanPending();
    }
    window.scrollTo(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeTab, selector.isChange]);
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
          <div className="tabs-container">
            <Button
              className={
                sessionStorage.getItem("role") === "Staff"
                  ? "custom-button-plan-staff"
                  : "custom-button-plan-manager"
              }
              onClick={() => {
                setOpen(!open);
                setTitle("Add New Subscription Plan");
                formVariable.resetFields();
              }}
            >
              Add New Subscription Plan
            </Button>
            {sessionStorage.getItem("role") === "Manager" && (
              <Tabs
                defaultActiveKey={activeTab}
                className="custom-tabs"
                onChange={(key) => {
                  setActiveTab(key);
                  setDataSource([]);
                }}
              >
                <TabPane tab="Pending" key="pending" />
                <TabPane tab="Active" key="true" />
                <TabPane tab="Deleted" key="false" />
              </Tabs>
            )}
          </div>
          <Table
            dataSource={dataSource}
            columns={columns}
            pagination={{
              pageSize: pageSize,
              current: currentPage,
              onChange: (page) => setCurrentPage(page), // Đảm bảo rằng currentPage được truyền vào
            }}
            rowKey={(record) => record.planId}
          />
        </Content>
      </Layout>
      <Modal
        title={title}
        open={open}
        onOk={handleSubmit}
        onCancel={() => setOpen(!open)}
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
            label="Plan Name"
            name="planName"
            rules={[{ required: true, message: "Please input plan name!" }]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            label="Description"
            name="description"
            rules={[{ required: true, message: "Please input description!" }]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            label="Price"
            name="price"
            rules={[{ required: true, message: "Please input price!" }]}
          >
            <Input type="number" />
          </Form.Item>
          <Form.Item
            label="Duration"
            name="duration"
            rules={[{ required: true, message: "Please input duration!" }]}
          >
            <Input type="number" />
          </Form.Item>
        </Form>
      </Modal>

      <Modal
        title={
          activeTab == "true"
            ? "Delete Subscription Plan"
            : "Enable Subscription Plan"
        }
        open={openDelete}
        onOk={handleDelete}
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
        <p>
          {activeTab == "true"
            ? "Are you really to delete subscription plan???"
            : "Are you really to enable subscription plan???"}
        </p>
      </Modal>
      <Modal
        title="Content Quality Verification"
        open={openConfirm}
        onCancel={() => setOpenConfirm(!openConfirm)}
        footer={null}
      >
        <p>Please check carefully before accepting to avoid mistakes!</p>
        <div style={{ textAlign: "right", marginTop: "20px" }}>
          <Button
            onClick={() => setOpenConfirm(false)}
            style={{
              color: "#5a6c76",
              borderColor: "#5a6c76",
              marginRight: "8px",
            }}
          >
            Cancel
          </Button>
          <Button
            onClick={() => handleCheckSubscriptionPlan(false)}
            style={{
              backgroundColor: "#e74c3c",
              borderColor: "#e74c3c",
              color: "#fff",
              marginRight: "8px",
            }}
          >
            Reject
          </Button>
          <Button
            onClick={() => handleCheckSubscriptionPlan(true)}
            style={{
              backgroundColor: "#536d79",
              borderColor: "#536d79",
              color: "#fff",
            }}
          >
            Accept
          </Button>
        </div>
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
    </Layout>
  );
}

export default SubscriptionPlanAdmin;
