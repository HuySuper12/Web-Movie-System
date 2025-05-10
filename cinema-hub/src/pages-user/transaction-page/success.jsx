import { useNavigate } from "react-router-dom";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import { useEffect } from "react";

function TransactionSuccess() {
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
          <div className="success-icon-transaction">&#10004;</div>

          {/* Failed */}
          <div className="success-message-transaction">
            Transaction Successful
          </div>
          <div className="description-transaction">
            Thank you for your purchase! Your order has been processed
            successfully.
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

export default TransactionSuccess;
