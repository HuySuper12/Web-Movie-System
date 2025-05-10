import { Flex, Menu, Modal } from "antd";
import { useNavigate } from "react-router-dom";
import {
  ProfileOutlined,
  LogoutOutlined,
  UsergroupAddOutlined,
  DashboardOutlined,
  PlayCircleOutlined,
  TagsOutlined,
  StarOutlined,
  NotificationOutlined,
  CommentOutlined,
  TransactionOutlined,
} from "@ant-design/icons";
import { useEffect, useState } from "react";
import { logoutAccount, refreshTokens } from "../../redux/actions/authenAction";
import { useDispatch } from "react-redux";

function SideBarAdmin() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [open, setOpen] = useState(false);

  const handleHomePage = () => {
    localStorage.setItem("key", 1);
    navigate("/admin");
  };

  const handleChooseMenu = (items) => {
    localStorage.setItem("key", items.key);
    const key = localStorage.getItem("key");
    if (key == "1") {
      navigate("/admin");
    } else if (key == "2") {
      navigate("/account-admin");
    } else if (key == "3") {
      navigate("/movie-admin");
    } else if (key == "4") {
      navigate("/movie-genre-admin");
    } else if (key == "5") {
      navigate("/view-rating-admin");
    } else if (key == "6") {
      navigate("/comment-admin");
    } else if (key == "7") {
      navigate("/notification-admin");
    } else if (key == "8") {
      navigate("/subscription-plan-admin");
    } else if (key == "9") {
      navigate("/payment-admin");
    } else if (key == "10") {
      navigate("/profile-admin");
    } else if (key == "11") {
      setOpen(!open);
    }
  };

  const handleLogoutAccount = async () => {
    navigate("/");
    await dispatch(logoutAccount({ email: sessionStorage.getItem("email") }));
    localStorage.removeItem("key");
  };

  const handleRenewAccessToken = async (data) => {
    const response = await dispatch(refreshTokens({ email: data }));
    if (response.payload.error === true) {
      handleLogoutAccount();
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
    if (localStorage.getItem("key") === null) {
      localStorage.setItem("key", "1");
    }

    handleCheckExpiredToken(); //Kiem tra thoi han token
    window.scroll(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <>
      <Flex align="center" justify="center" className="logo">
        <div className="logo" onClick={handleHomePage}>
          <img
            src="https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526"
            alt=""
            width={85}
          />
        </div>
      </Flex>
      <Menu
        mode="inline"
        defaultSelectedKeys={
          localStorage.getItem("key") === null
            ? "1"
            : localStorage.getItem("key")
        }
        className="menu-bar"
        onClick={handleChooseMenu}
        items={[
          {
            key: "1",
            icon: <DashboardOutlined />,
            label: "Dashboard",
          },
          {
            key: "2",
            icon: <UsergroupAddOutlined />,
            label: "Account",
          },
          {
            key: "3",
            icon: <PlayCircleOutlined />,
            label: "Movie",
          },
          {
            key: "4",
            icon: <TagsOutlined />,
            label: "Movie Genre",
          },
          {
            key: "5",
            icon: <StarOutlined />,
            label: "View Rating",
          },
          {
            key: "6",
            icon: <CommentOutlined />,
            label: "Comment",
          },
          {
            key: "7",
            icon: <NotificationOutlined />,
            label: "Notification",
          },
          {
            key: "8",
            icon: <ProfileOutlined />,
            label: "Subscription Plan",
          },
          {
            key: "9",
            icon: <TransactionOutlined />,
            label: "Payment",
          },

          {
            key: "10",
            icon: <ProfileOutlined />,
            label: "Profile",
          },
          {
            key: "11",
            icon: <LogoutOutlined />,
            label: "Logout",
          },
        ]}
      />
      <Modal
        title="Logout Account"
        open={open}
        onOk={handleLogoutAccount}
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
        <p>Are you really to logout your account???</p>
      </Modal>
    </>
  );
}

export default SideBarAdmin;
