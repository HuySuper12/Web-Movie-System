import { Typography } from "antd";
import "./index.scss"; // CSS file for styling
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import { useEffect, useRef, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import { viewPaymentListByEmail } from "../../redux/actions/paymentAction";
import { debounce } from "lodash";

const { Title } = Typography;

const PaymentHistory = () => {
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.payment);
  const navigate = useNavigate();
  const pageSize = 5; // Số bản ghi mỗi trang
  const [payment, setPayment] = useState([]);
  const [lastPayment, setLastPayment] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const sidebarRef = useRef(null);

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

  const loadPayment = async (email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastPayment === "") {
      if (selector.lastPaymentId !== 0 && lastPayment === "") {
        setLastPayment(selector.lastPaymentId);
        setPayment(selector.payment);
      } else {
        const response = await dispatch(
          viewPaymentListByEmail({
            email: email,
            pageSize: pageSize,
            paymentId: "1000000000",
          })
        );

        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }
        setLastPayment(
          response.payload.data[response.payload.data.length - 1].paymentId
        );
        setPayment(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewPaymentListByEmail({
          email: email,
          pageSize: pageSize,
          paymentId: lastPayment,
        })
      );

      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }
      setLastPayment(
        response.payload.data[response.payload.data.length - 1].paymentId
      );
      setPayment((pre) => [...pre, ...response.payload.data]);
    }

    setLoading(false);
  };

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await loadPayment(sessionStorage.getItem("email"), pageSize);
    }
  }, 500);

  useEffect(() => {
    if (sessionStorage.getItem("email") === null) {
      navigate("/login");
    }
    if (payment.length == 0) {
      loadPayment(sessionStorage.getItem("email"), pageSize);
    }
    //Dung custome sidebar scroll
    const sidebar = sidebarRef.current;
    if (sidebar) sidebar.addEventListener("scroll", handleScroll);
    return () => sidebar?.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [loading, lastPayment]);
  return (
    <>
      <HeaderUser />
      <center>
        <div className="payment-history-container">
          <Title
            level={3}
            style={{
              marginBottom: 20,
              color: "gold",
              background: "#333",
              padding: 10,
              borderRadius: 10,
              boxShadow: "0px 4px 20px rgba(0, 0, 0, 0.15)", // Định dạng chuẩn
              fontFamily: "'Playfair Display', serif",
              textShadow: "0px 4px 8px rgba(255, 223, 0, 0.6)",
            }}
          >
            Payment History
          </Title>
          {payment.length > 0 ? (
            <div className="table-container" ref={sidebarRef}>
              <table className="table-payment">
                <thead className="thead-payment">
                  <tr>
                    <th className="th-payment">No.</th>
                    <th className="th-payment">Date</th>
                    <th className="th-payment">Amount</th>
                    <th className="th-payment">Subscription Plan</th>
                    <th className="th-payment">Expired Date</th>
                    <th className="th-payment">Status</th>
                    <th className="th-payment">Payment Method</th>
                  </tr>
                </thead>
                <tbody className="tbody-payment">
                  {payment.map((item, index) => (
                    <tr key={index}>
                      <td className="td-payment">{index + 1}</td>
                      <td className="td-payment">
                        {formatDate(item.paymentDate)}
                      </td>
                      <td className="td-payment">
                        {formatNumber(item.amount)} VND
                      </td>
                      <td className="td-payment">
                        {item.subscriptionPlan.planName}
                      </td>
                      <td className="td-payment">
                        {formatDate(item.expiryDate)}
                      </td>
                      <td className="td-payment">
                        <span
                          className={
                            item.paymentStatus == "Success"
                              ? "tag completed"
                              : "tag failed"
                          }
                        >
                          {item.paymentStatus}
                        </span>
                      </td>
                      <td className="td-payment">
                        {item.paymentMethod === "VNPAY" && (
                          <div className="payment-method">
                            <img
                              src="https://cdn-new.topcv.vn/unsafe/https://static.topcv.vn/company_logos/cong-ty-cp-giai-phap-thanh-toan-viet-nam-vnpay-6194ba1fa3d66.jpg"
                              alt="VNPay"
                              width={30}
                            />
                            VNPAY
                          </div>
                        )}
                        {item.paymentMethod === "MoMo" && (
                          <div className="payment-method">
                            <img
                              src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-MoMo-Circle.png"
                              alt="MoMo"
                              width={30}
                            />
                            MoMo
                          </div>
                        )}
                        {item.paymentMethod === "PayPal" && (
                          <div className="payment-method">
                            <img
                              src="https://rushdah-ir.com/wp-content/uploads/2018/03/payal-img.webp"
                              alt="PayPal"
                              width={30}
                            />
                            PayPal
                          </div>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
              {window.innerHeight + window.scrollY >=
              document.body.offsetHeight - 500
                ? hasMore && (
                    <div className="loading-container">
                      <div className="spinner"></div>
                      <p className="loading-text">Please wait...</p>
                    </div>
                  )
                : null}
            </div>
          ) : (
            <p className="no-payment">
              You do not have any payment history yet.
            </p>
          )}
        </div>
      </center>
      <Footer />
    </>
  );
};

export default PaymentHistory;
