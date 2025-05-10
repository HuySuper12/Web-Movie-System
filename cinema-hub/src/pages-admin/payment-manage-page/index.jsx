/* eslint-disable no-unused-vars */
import { Button, Layout, Table } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { Bounce, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  subscriptionPlanSearchName,
  viewAllSubscriptionStatus,
  viewSubscriptionDetail,
} from "../../redux/actions/subscriptionPlanAction";
import {
  handleSearchAccount,
  viewProfileId,
} from "../../redux/actions/accountAction";
import { viewAllPayments } from "../../redux/actions/paymentAction";
import { debounce } from "lodash";

const { Sider, Header, Content } = Layout;
function PaymentAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.payment);
  const selectorAccount = useSelector((state) => state.account);
  const selectorSubscription = useSelector((state) => state.subscriptionPlan);

  let statusList = ["Success", "Fail"];
  const [subscriptionList, setSubscriptionList] = useState([]); // Danh sách gói cước dung de filter
  const [nameSubscriptionCache, setNameSubscriptionCache] = useState({}); // Cache tên goi cuoc
  const [violationCountCache, setViolationCountCache] = useState({});
  const [nameCache, setNameCache] = useState({}); // Cache tên khach hang
  const [dataSource, setDataSource] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 8; // Số bản ghi mỗi trang

  const [lastPayment, setLastPayment] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

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
      title: "Payment Code",
      dataIndex: "paymentCode",
      key: "paymentCode",
      align: "center",
    },
    {
      title: "Plan Name",
      dataIndex: "subscriptionPlanId",
      key: "subscriptionPlanId",
      align: "center",
      render: (planId) => nameSubscriptionCache[planId] || "Loading...",
      filters: subscriptionList.map((item) => ({
        text: item.planName,
        value: item.planName,
      })),
      onFilter: (value, record) => {
        var name = nameSubscriptionCache[record.subscriptionPlanId];
        return name === value;
      },
    },
    {
      title: "Customer Name",
      dataIndex: "userId",
      key: "userId",
      align: "center",
      render: (userId) => nameCache[userId] || "Loading...",
    },
    {
      title: "Payment Date",
      dataIndex: "paymentDate",
      key: "paymentDate",
      align: "center",
      render: (text) => formatDate(text),
    },
    {
      title: "Expiry Date",
      dataIndex: "expiryDate",
      key: "expiryDate",
      align: "center",
      render: (text) => formatDate(text),
    },
    {
      title: "Amount",
      dataIndex: "amount",
      key: "amount",
      align: "center",
      render: (text) => formatNumber(text),
    },
    {
      title: "Status",
      dataIndex: "paymentStatus",
      key: "paymentStatus",
      align: "center",
      filters: statusList.map((item) => ({
        text: item,
        value: item,
      })),
      onFilter: (value, record) => record.paymentStatus === value,
    },
    {
      title: "Payment Method",
      dataIndex: "paymentMethod",
      key: "paymentMethod",
      align: "center",
    },
  ];

  const handleSearchSubscriptionName = async (id) => {
    if (nameSubscriptionCache[id]) {
      // Nếu đã có trong cache, trả về ngay
      return nameSubscriptionCache[id];
    }

    if (selectorSubscription.subscriptionPlanSearchName[id] !== undefined) {
      setNameSubscriptionCache((prev) => ({
        ...prev,
        [id]: selectorSubscription.subscriptionPlanSearchName[id], // Lưu kết quả vào cache
      }));
      return;
    }

    // Nếu chưa có, gọi API để lấy dữ liệu
    const response = await dispatch(viewSubscriptionDetail({ id }));
    const planName = response.payload.data.planName;
    setNameSubscriptionCache((prev) => ({
      ...prev,
      [id]: planName, // Lưu kết quả vào cache
    }));
    const data = {
      id: id,
      subscriptionPlanName: response.payload.data.planName,
    };
    subscriptionPlanSearchName(dispatch, data);
    return planName;
  };

  const handleSearchName = async (id) => {
    if (nameCache[id]) {
      // Nếu đã có trong cache, trả về ngay
      return nameCache[id];
    }

    // Nếu đã có trong cache redux, trả về ngay
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

  //Format Number
  const formatNumber = (number) => {
    return number.toLocaleString("en-US");
  };

  const loadSubscriptionPlan = async (status) => {
    const response = await dispatch(viewAllSubscriptionStatus({ status }));
    setSubscriptionList(response.payload.data);
  };

  const loadPayment = async (pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastPayment === "") {
      if (selector.lastPaymentId !== 0 && lastPayment === "") {
        setLastPayment(selector.lastPaymentId);
        setDataSource(selector.payment);

        await Promise.all(
          selector.payment.map((item) =>
            Promise.all([
              handleSearchSubscriptionName(item.subscriptionPlanId),
              handleSearchName(item.userId),
            ])
          )
        );
      } else {
        const response = await dispatch(
          viewAllPayments({ pageSize: pageSize, paymentId: "1000000000" })
        );
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        await Promise.all(
          response.payload.data.map((item) =>
            Promise.all([
              handleSearchSubscriptionName(item.subscriptionPlanId),
              handleSearchName(item.userId),
            ])
          )
        );
        setLastPayment(
          response.payload.data[response.payload.data.length - 1].paymentId
        );
        setDataSource(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewAllPayments({ pageSize: pageSize, paymentId: lastPayment })
      );
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      await Promise.all(
        response.payload.data.map((item) =>
          Promise.all([
            handleSearchSubscriptionName(item.subscriptionPlanId),
            handleSearchName(item.userId),
          ])
        )
      );
      setLastPayment(
        response.payload.data[response.payload.data.length - 1].paymentId
      );
      setDataSource((pre) => [...pre, ...response.payload.data]);
    }

    setLoading(false);
  };

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await loadPayment(pageSize);
    }
  }, 500);

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }
    if (dataSource.length === 0) {
      loadPayment(pageSize);
      loadSubscriptionPlan(true);
    }
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [lastPayment, loading]);
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
            rowKey={(record) => record.paymentId}
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

export default PaymentAdmin;
