// React Component for Contact Page
import { useEffect } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss"; // You can add the CSS styles in this file

const Contact = () => {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);
  return (
    <>
      <HeaderUser />
      <div className="contact-page">
        <section className="contact-info">
          <h2>Get in Touch</h2>
          <p>
            If you have any questions or need assistance, feel free to reach out
            to us using the contact details below.
          </p>
          <ul>
            <li>
              <strong>Email:</strong>{" "}
              <a href="mailto:support@cinemahub.com">support@cinemahub.com</a>
            </li>
            <li>
              <strong>Phone:</strong> <a href="tel:+18001234">1800-1234</a>
            </li>
            <li>
              <strong>Address:</strong> 123 ABC Street, District 1, Ho Chi Minh
              City, Vietnam
            </li>
          </ul>
        </section>

        <section className="contact-form">
          <h2>Send Us a Message</h2>
          <form>
            <input type="text" name="name" placeholder="Your Name" required />
            <input
              type="email"
              name="email"
              placeholder="Your Email"
              required
            />
            <textarea
              name="message"
              placeholder="Your Message"
              rows="6"
              required
            ></textarea>
            <button type="submit" className="submit-btn">
              Submit
            </button>
          </form>
        </section>
      </div>
      <Footer />
    </>
  );
};

export default Contact;
