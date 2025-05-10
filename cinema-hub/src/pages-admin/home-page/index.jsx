import { Button, Flex, Layout } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import MainContent from "../../components/content/MainContent";
import SideContent from "../../components/content/SideContent";
import { useNavigate } from "react-router-dom";
import { Bounce, ToastContainer } from "react-toastify";

const { Sider, Header, Content } = Layout;
function HomePageAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }
    window.scrollTo(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionStorage.getItem("key")]);
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
          <Flex gap="large">
            <MainContent />
            <SideContent />
          </Flex>
        </Content>
      </Layout>
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

export default HomePageAdmin;
