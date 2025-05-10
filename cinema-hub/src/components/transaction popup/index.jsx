import { useEffect, useState } from "react";
import "./index.scss";
import { useDispatch, useSelector } from "react-redux";
import { viewSubscriptionDetail } from "../../redux/actions/subscriptionPlanAction";
import {
  createMoMoUrl,
  createPayPalUrl,
  createVNPAYUrl,
} from "../../redux/actions/transactionAction";
import { Bounce, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

// eslint-disable-next-line react/prop-types
const PaymentPopup = ({ isOpen, onClose }) => {
  const selector = useSelector((state) => state.subscriptionPlan);
  const dispatch = useDispatch();
  const [selectedMethod, setSelectedMethod] = useState("");
  const [subscriptionPlan, setSubscriptionPlan] = useState("");

  const handlePayment = async () => {
    if (selectedMethod === "") {
      toast.error("Please select a payment method");
      return;
    }

    const data = {
      userEmail: sessionStorage.getItem("email"),
      subscriptionPlanId: subscriptionPlan.planId,
      amount: subscriptionPlan.price,
      expiryDate: subscriptionPlan.duration,
    };

    if (selectedMethod == "VNPay") {
      const response = await dispatch(createVNPAYUrl(data));
      window.location.href = response.payload.data;
    }

    if (selectedMethod == "MoMo") {
      const response = await dispatch(createMoMoUrl(data));
      window.location.href = response.payload.data;
    }

    if (selectedMethod == "PayPal") {
      const response = await dispatch(createPayPalUrl(data));
      window.location.href = response.payload.data;
    }
  };

  const loadSubscriptionPlanDetail = async (id) => {
    if (id === 0) return;
    const response = await dispatch(viewSubscriptionDetail({ id: id }));
    setSubscriptionPlan(response.payload.data);
  };

  useEffect(() => {
    loadSubscriptionPlanDetail(selector.subscriptionPlanDetails);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange]);

  if (!isOpen) return null;

  return (
    <div className="popup-overlay">
      <div className="popup-container">
        <h2 className="popup-title">Payment Method</h2>
        <div className="payment-options">
          <div
            className={`payment-method ${
              selectedMethod === "MoMo" ? "active" : ""
            }`}
            onClick={() => setSelectedMethod("MoMo")}
          >
            <img
              src="https://cdn.haitrieu.com/wp-content/uploads/2022/10/Logo-MoMo-Circle.png"
              alt="MoMo"
              width={60}
            />
            <span>MoMo</span>
          </div>
          <div
            className={`payment-method ${
              selectedMethod === "VNPay" ? "active" : ""
            }`}
            onClick={() => setSelectedMethod("VNPay")}
          >
            <img
              src="https://cdn-new.topcv.vn/unsafe/https://static.topcv.vn/company_logos/cong-ty-cp-giai-phap-thanh-toan-viet-nam-vnpay-6194ba1fa3d66.jpg"
              alt="VNPay"
              width={60}
            />
            <span>VNPay</span>
          </div>
          <div
            className={`payment-method ${
              selectedMethod === "PayPal" ? "active" : ""
            }`}
            onClick={() => setSelectedMethod("PayPal")}
          >
            <img
              src="https://www.advancedisco.co.uk/news/wp-content/uploads/2023/12/Paypal_2014_logo.png"
              alt="PayPal"
              width={60}
            />
            <span>PayPal</span>
          </div>
        </div>
        <div className="popup-actions">
          <button className="confirm-btn" onClick={handlePayment}>
            Confirm
          </button>
          <button className="cancel-btn" onClick={onClose}>
            Cancel
          </button>
        </div>
        {/* <PayPalScriptProvider
          options={{
            "client-id":
              "AQfXXn0O9Ktxz8c4ljRSBSdmjDm3pmE5CSPxYO9bbLCD7thKidtPrFmHU2A9BZ_Sa_eqrkeHBD_f4L6b",
          }}
        >
          <PayPalButtons
            createOrder={(data, actions) => {
              return actions.order.create({
                purchase_units: [
                  {
                    amount: { value: "10.00" },
                  },
                ],
              });
            }}
            onApprove={(data, actions) => {
              return actions.order.capture().then((details) => {
                alert(
                  "Transaction completed by " + details.payer.name.given_name
                );
              });
            }}
          />
        </PayPalScriptProvider> */}
      </div>
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
    </div>
  );
};

export default PaymentPopup;
