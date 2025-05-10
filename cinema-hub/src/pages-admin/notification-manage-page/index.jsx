import { Button, Layout, Table } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";

import {
  viewAllUserNotification,
  viewStaffNotification,
} from "../../redux/actions/notificationAction";
import {
  handleSearchAccount,
  viewProfileId,
} from "../../redux/actions/accountAction";
import { Bounce, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { debounce } from "lodash";

const { Sider, Header, Content } = Layout;
function NotificationAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.notification);
  const selectorAccount = useSelector((state) => state.account);

  const [nameCache, setNameCache] = useState({}); // Cache tên nhân viên
  // eslint-disable-next-line no-unused-vars
  const [violationCountCache, setViolationCountCache] = useState({});
  const [dataSource, setDataSource] = useState([]);
  // eslint-disable-next-line no-unused-vars
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 10; // Số bản ghi mỗi trang

  const [lastNotification, setLastNotification] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  const columns = [
    {
      title: "No",
      dataIndex: "key",
      align: "center",
      width: 70,
      render: (text, record, index) => {
        return (currentPage - 1) * pageSize + index + 1;
      },
    },
    {
      // title: "Staff Name",
      title: (
        <div style={{ textAlign: "center", width: "100%" }}>Staff Name</div>
      ),
      dataIndex: "userId",
      key: "userId",
      align: "left",
      width: 100,
      render: (userId) => nameCache[userId] || "Loading...",
    },
    {
      // title: "Receiver Name",
      title: (
        <div style={{ textAlign: "center", width: "100%" }}>Receiver Name</div>
      ),
      dataIndex: "receiverId",
      key: "receiverId",
      align: "left",
      width: 100,
      render: (userId) => nameCache[userId] || "Loading...",
    },
    {
      title: <div style={{ textAlign: "center", width: "100%" }}>Title</div>,
      dataIndex: "title",
      key: "title",
      align: "left",
      width: 200,
    },
    {
      title: <div style={{ textAlign: "center", width: "100%" }}>Content</div>,
      dataIndex: "contentDetail",
      key: "contentDetail",
      align: "left",
      width: 300,
    },
  ];

  const loadStaffNotification = async (email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastNotification === "") {
      if (selector.lastNotificationId !== 0 && lastNotification === "") {
        setLastNotification(selector.lastNotificationId);
        setDataSource(selector.notification);

        await Promise.all(
          selector.notification.map((item) =>
            Promise.all([
              handleSearchName(item.receiverId),
              handleSearchName(item.userId),
            ])
          )
        );
      } else {
        const response = await dispatch(
          viewStaffNotification({
            email: email,
            pageSize: pageSize,
            id: "1000000000",
          })
        );

        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        await Promise.all(
          selector.notification.map((item) =>
            Promise.all([
              handleSearchName(item.receiverId),
              handleSearchName(item.userId),
            ])
          )
        );

        setLastNotification(
          response.payload[response.payload.length - 1].notificationId
        );
        setDataSource(response.payload);
      }
    } else {
      const response = await dispatch(
        viewStaffNotification({
          email: email,
          pageSize: pageSize,
          id: lastNotification,
        })
      );
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      await Promise.all(
        selector.notification.map((item) =>
          Promise.all([
            handleSearchName(item.receiverId),
            handleSearchName(item.userId),
          ])
        )
      );

      setLastNotification(
        response.payload[response.payload.length - 1].notificationId
      );
      setDataSource((prev) => [...prev, ...response.payload]);
    }

    setLoading(false);
  };

  const loadAllNotification = async (pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastNotification === "") {
      if (selector.lastNotificationId !== 0 && lastNotification === "") {
        setLastNotification(selector.lastNotificationId);
        setDataSource(selector.notification);

        await Promise.all(
          selector.notification.map((item) =>
            Promise.all([
              handleSearchName(item.receiverId),
              handleSearchName(item.userId),
            ])
          )
        );
      } else {
        const response = await dispatch(
          viewAllUserNotification({ pageSize: pageSize, id: "1000000000" })
        );

        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        await Promise.all(
          response.payload.data.map((item) =>
            Promise.all([
              handleSearchName(item.receiverId),
              handleSearchName(item.userId),
            ])
          )
        );

        setLastNotification(
          response.payload.data[response.payload.data.length - 1].notificationId
        );
        setDataSource(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewAllUserNotification({ pageSize: pageSize, id: lastNotification })
      );
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      await Promise.all(
        response.payload.data.map((item) =>
          Promise.all([
            handleSearchName(item.receiverId),
            handleSearchName(item.userId),
          ])
        )
      );

      setLastNotification(
        response.payload.data[response.payload.data.length - 1].notificationId
      );
      setDataSource((prev) => [...prev, ...response.payload.data]);
    }

    setLoading(false);
  };

  const handleSearchName = async (id) => {
    if (nameCache[id]) {
      // Nếu đã có trong cache, trả về ngay
      return nameCache[id];
    }

    if (selectorAccount.accountSearchName[id] !== undefined) {
      setNameCache((prev) => ({
        ...prev,
        [id]: selectorAccount.accountSearchName[id], // Lưu kết quả vào cache
      }));
      setViolationCountCache((prev) => ({
        ...prev,
        [id]: selectorAccount.violationCount[id], // Lưu kết quả vào cache
      }));
      return;
    }

    // Nếu chưa có, gọi API để lấy dữ liệu
    const response = await dispatch(viewProfileId(id));
    const fullName = response.payload.data.fullName;
    setNameCache((prev) => ({
      ...prev,
      [id]: fullName, // Lưu kết quả vào cache
    }));
    const violationCount = response.payload.data.violationCount;
    setViolationCountCache((prev) => ({
      ...prev,
      [id]: violationCount, // Lưu kết quả vào cache
    }));
    const data = {
      id: id,
      fullName: response.payload.data.fullName,
      violation: response.payload.data.violationCount,
    };

    handleSearchAccount(dispatch, data);
    return fullName;
  };

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      if (sessionStorage.getItem("role") === "Staff") {
        await loadStaffNotification(sessionStorage.getItem("email"), pageSize);
      } else {
        await loadAllNotification(pageSize);
      }
    }
  }, 500);

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }

    if (dataSource.length == 0) {
      if (sessionStorage.getItem("role") === "Staff") {
        loadStaffNotification(sessionStorage.getItem("email"), pageSize);
      } else {
        loadAllNotification(pageSize);
      }
    }
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, lastNotification]);
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
          <Table
            dataSource={dataSource}
            columns={columns}
            pagination={false}
            rowKey={(record) => record.notificationId}
          />
          <div style={{ padding: "10px 0", textAlign: "center" }}>
            {window.innerHeight + window.scrollY >=
            document.body.offsetHeight - 500
              ? hasMore && (
                  <div className="loading-containers">
                    <div className="spinners"></div>
                    <p className="loading-texts">Please wait...</p>
                  </div>
                )
              : null}
          </div>
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

export default NotificationAdmin;
