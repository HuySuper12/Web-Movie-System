import { useNavigate } from "react-router-dom";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import { useEffect } from "react";

function TransactionFail() {
  const navigate = useNavigate();

  const handleMoveHome = () => {
    navigate("/");
  };

  useEffect(() => {
    if (sessionStorage.getItem("email") === null) {
      handleMoveHome();
    }
  }, []);
  return (
    <>
      <HeaderUser />
      <div className="transaction-page">
        <div className="background-effect"></div>
        <div className="success-container-transaction">
          <div className="success-icon-transaction">&#10008;</div>
          <div className="success-message-transaction">Transaction Fail</div>
          <div className="description-transaction">
            We regret to inform you that your transaction could not be
            processed. Please try again or contact support.
          </div>
          <button className="button-transaction" onClick={handleMoveHome}>
            Back to Homepage
          </button>
        </div>
      </div>
      <Footer />
    </>
  );
}

export default TransactionFail;
