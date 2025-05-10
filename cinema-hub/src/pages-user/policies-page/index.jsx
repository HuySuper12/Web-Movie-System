import { useEffect } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";

const PolicyPage = () => {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  return (
    <div className="container">
      <HeaderUser />
      <div className="policy-container">
        <h1 className="policy-title">Our Policies</h1>

        <section className="policy-section">
          <h2>1. Privacy Policy</h2>
          <p>
            We are committed to protecting your personal information. The
            information collected will only be used to enhance your experience
            on our platform. You can find more details in the{" "}
            <strong>Privacy Policy</strong> section.
          </p>
        </section>

        <section className="policy-section">
          <h2>2. Terms of Use</h2>
          <p>
            By using our services, you agree to comply with copyright
            regulations and refrain from using the services for illegal
            purposes. We reserve the right to suspend or terminate your account
            if violations are detected.
          </p>
        </section>

        <section className="policy-section">
          <h2>3. Privacy Policy Details</h2>
          <p>
            Personal data such as email and viewing history will be kept
            strictly confidential. We do not share this information with third
            parties without your consent.
          </p>
        </section>

        <section className="policy-section">
          <h2>4. Payment Policy</h2>
          <p>
            Transactions on our platform are carried out through secure payment
            gateways. If any errors occur during the payment process, please
            contact our support team for assistance.
          </p>
        </section>
      </div>
      <Footer />
    </div>
  );
};

export default PolicyPage;
