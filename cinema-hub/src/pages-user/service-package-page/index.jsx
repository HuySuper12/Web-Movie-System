import { Button } from "antd";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import { useEffect, useState } from "react";
import {
  choosePayment,
  viewAllSubscription,
  viewAllSubscriptionStatus,
} from "../../redux/actions/subscriptionPlanAction";
import { useDispatch, useSelector } from "react-redux";
import PaymentPopup from "../../components/transaction popup";
import { useNavigate } from "react-router-dom";

const ServicePackage = () => {
  const selector = useSelector((state) => state.subscriptionPlan);
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const [subscriptionPlan, setSubscriptionPlan] = useState([]);
  const [isOpen, setIsOpen] = useState(false);

  const loadSubscriptionPlan = async (status, email) => {
    if (selector.subscriptionPlan.length > 0) {
      setSubscriptionPlan(selector.subscriptionPlan);
      return;
    }
    const response = await dispatch(
      viewAllSubscription({ status: status, email: email })
    );
    setSubscriptionPlan(response.payload.data);
  };

  const loadSubscriptionPlanDefault = async (status) => {
    if (selector.subscriptionPlan.length > 0) {
      setSubscriptionPlan(selector.subscriptionPlan);
      return;
    }
    const response = await dispatch(
      viewAllSubscriptionStatus({ status: status })
    );
    setSubscriptionPlan(response.payload.data);
  };

  const formatNumber = (number) => {
    return number.toLocaleString("en-US");
  };

  const handleChoose = (id) => {
    if (sessionStorage.getItem("email") == null) {
      navigate("/login");
    }
    setIsOpen(true);
    choosePayment(dispatch, id);
  };

  useEffect(() => {
    if (sessionStorage.getItem("email") != null) {
      loadSubscriptionPlan(true, sessionStorage.getItem("email"));
    } else {
      loadSubscriptionPlanDefault(true);
    }

    window.scrollTo(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
  return (
    <>
      <HeaderUser />
      <div className="service-package-page">
        <h1 className="title">Choose Suitable Service Package</h1>
        <section className="service-selection">
          {subscriptionPlan.map((item, index) => (
            <div className="service-option" key={index}>
              <div className="package-title">{item.planName}</div>
              <div className="package-details">
                <p>
                  <strong>Price:</strong> {formatNumber(item.price)} VND
                </p>
                <p>
                  <strong>Quality:</strong> Full HD
                </p>
                <p>
                  <strong>Resolution:</strong> 480p
                </p>
                <p>
                  <strong>Duration:</strong> {item.duration} days
                </p>
                <p style={{ marginBottom: "10px" }}>
                  <strong>Description:</strong> {item.description}
                </p>
              </div>
              <Button
                className="button"
                onClick={() => handleChoose(item.planId)}
              >
                Choose
              </Button>
            </div>
          ))}
        </section>
      </div>
      <PaymentPopup isOpen={isOpen} onClose={() => setIsOpen(false)} />
      <Footer />
    </>
  );
};

export default ServicePackage;
