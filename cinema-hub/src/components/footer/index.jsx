import { Link } from "react-router-dom";
import "./index.scss";

function Footer() {
  return (
    <div className="footer">
      <div className="footer-container">
        <div className="footer-section about">
          <h3>About MovieHub</h3>
          <p>
            Below is a more enriched and engaging version of the content,
            Suitable for formal and professional style:
            <br />
            - MovieHub is the leading online movie viewing platform, providing
            experience Great entertainment experience with diverse and quality
            content High. From action, emotion to comedy or horror, we answer
            Meet all your preferences.
            <br />- Let MovieHub become your travel companion The ultimate
            exploration of the world of cinema, where every movie is bring a
            story, a memorable experience!
          </p>
        </div>

        <div className="footer-section-links-contact">
          <div className="footer-section links">
            <h3>Quick Link</h3>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/movie-list">Movie</Link>
              </li>
              <li>
                <Link to="/servicePackage">Service package</Link>
              </li>
              <li>
                <Link to="/contact">Contact</Link>
              </li>
              <li>
                <Link to="/policies">Policies</Link>
              </li>
            </ul>
          </div>

          <div className="footer-section contact">
            <h3>Contact</h3>
            <p>📍 123 Đường ABC, Quận 1, TP. Hồ Chí Minh</p>
            <p>📧 Email: support@cinemahub.com</p>
            <p>📞 Hotline: 1800-1234</p>
          </div>
        </div>
      </div>

      <div className="footer-bottom">
        <p>&copy; 2024 MovieHub. All rights reserved.</p>
      </div>
    </div>
  );
}

export default Footer;
