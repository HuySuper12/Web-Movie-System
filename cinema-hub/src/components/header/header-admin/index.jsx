import { Avatar, Flex, Form, Input, Modal, Typography } from "antd";
import Search from "antd/es/input/Search";
import {
  MessageOutlined,
  NotificationOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { useEffect, useState } from "react";
import { loadAccount } from "../../../redux/actions/accountAction";
import TextArea from "antd/es/input/TextArea";
import { useForm } from "antd/es/form/Form";
import { useDispatch, useSelector } from "react-redux";
import { addNotificationUser } from "../../../redux/actions/notificationAction";
import { toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { notificationChange } from "../../../redux/reducers/notificationSlice";

function HeaderAdmin() {
  const [account, setAccount] = useState({});
  const [open, setOpen] = useState(false);
  const [title, setTitle] = useState("");
  const [formVariable] = useForm();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.authen);

  const handleSubmit = () => {
    formVariable.submit();
  };

  const handleFinishForm = async (values) => {
    if (title === "Send Notification") {
      const data = {
        staffEmail: sessionStorage.getItem("email"),
        receiverEmail: "all",
        title: values.title,
        content: values.content,
      };
      const response = await dispatch(addNotificationUser(data));
      if (response.payload == true) {
        toast.success("Send Notification Successfully");
        formVariable.resetFields();
        dispatch(notificationChange());
        setOpen(!open);
      } else {
        toast.error("Send Notification Failed");
      }
    } else {
      const data = {
        staffEmail: sessionStorage.getItem("email"),
        receiverEmail: values.email,
        title: values.title,
        content: values.content,
      };
      const response = await dispatch(addNotificationUser(data));
      if (response.payload == true) {
        toast.success("Send Notification Successfully");
        formVariable.resetFields();
        dispatch(notificationChange());
        setOpen(!open);
      } else {
        toast.error("Send Notification Failed");
      }
    }
  };

  const loadProfile = async (email) => {
    const response = await dispatch(loadAccount({ email }));
    setAccount(response.payload.data);
  };

  useEffect(() => {
    loadProfile(sessionStorage.getItem("email"));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange]);

  return (
    <Flex align="center" justify="space-arround" gap="30rem">
      <Typography.Title level={4} type="secondary">
        {sessionStorage.getItem("role") == "Staff"
          ? "Welcome back, Administrator"
          : "Welcome back, Manager"}
      </Typography.Title>
      <Flex align="center" gap="100px">
        <Search placeholder="Search Dashboard" allowClear />
        <Flex align="center" gap="10px">
          <MessageOutlined
            className="header-icon"
            onClick={() => {
              setOpen(!open);
              setTitle("Send Specifically Notification");
            }}
          />
          <NotificationOutlined
            className="header-icon"
            onClick={() => {
              setOpen(!open);
              setTitle("Send Notification");
            }}
          />
          <Avatar
            icon={
              account.profilePicture === null ? <UserOutlined /> : undefined
            }
            src={
              account.profilePicture !== null
                ? account.profilePicture
                : undefined
            }
          />
          <Modal
            title={title}
            open={open}
            onOk={handleSubmit}
            onCancel={() => {
              setOpen(!open);
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
              {title === "Send Specifically Notification" && (
                <Form.Item
                  label="Email Receiver"
                  name="email"
                  rules={[
                    {
                      required: true,
                      message: "Please input your Email!",
                    },
                  ]}
                >
                  <Input />
                </Form.Item>
              )}
              <Form.Item
                label="Title"
                name="title"
                rules={[
                  { required: true, message: "Please input your Title!" },
                ]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                name="content"
                label="Content"
                rules={[
                  {
                    required: true,
                    message: "Please input your Content!",
                  },
                ]}
              >
                <TextArea rows="5" />
              </Form.Item>
            </Form>
          </Modal>
        </Flex>
      </Flex>
    </Flex>
  );
}

export default HeaderAdmin;
