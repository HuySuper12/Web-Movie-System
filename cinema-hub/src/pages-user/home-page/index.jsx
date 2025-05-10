import { Button, Input } from "antd";
import Carousel from "../../components/carousel/carousel-home";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { checkAccount } from "../../redux/actions/accountAction";
import { useDispatch, useSelector } from "react-redux";
import { viewRatingStatisticAdmin } from "../../redux/actions/ratingAction";

function HomePage() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.authen);
  const [email, setEmail] = useState("");
  const [dataSource, setDataSource] = useState([]);

  const handleRegister = async () => {
    localStorage.setItem("email", email);
    const response = await dispatch(checkAccount(email));
    if (response.payload.error === true) {
      navigate("/register");
    } else {
      navigate("/login");
    }
  };

  const handlePressEnter = (event) => {
    if (event && event.key == "Enter") {
      handleRegister();
    }
  };

  const viewRatingStatistic = async (status, pageSize, lastMovieId) => {
    const response = await dispatch(
      viewRatingStatisticAdmin({
        status: status,
        pageSize: pageSize,
        lastMovieId: lastMovieId,
      })
    );
    setDataSource(response.payload.data);
  };

  const reasons = [
    {
      text: "Watch movies in sharp HD quality",
      icon: "📺",
    },
    {
      text: "Download to watch offline anytime, anywhere",
      icon: "⬇️",
    },
    {
      text: "No ads, seamless experience",
      icon: "🚫",
    },
    {
      text: "Share your account with family and friends",
      icon: "👨‍👩‍👧‍👦",
    },
  ];
  useEffect(() => {
    if (dataSource.length == 0) {
      viewRatingStatistic(true, 5, 1000000); //Cho lastMovieId = 1000000000000 (nam ngoai gia tri id) de lay 5 phim dau tien
    }
    window.scrollTo(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div>
      <HeaderUser className="header-user" />
      <Carousel />
      {selector.account.auth === false && (
        <div className="join-now-container">
          <p>
            Are you ready to watch? Enter your email to create or reactivate
            your membership.
          </p>
          <div className="email-input-group">
            <Input
              type="email"
              placeholder="Input your email"
              onChange={(event) => setEmail(event.target.value)}
              onKeyPress={(event) => handlePressEnter(event)} //Khi nhan Enter thi goi ham handleLogin
            />
            <Button type="danger" onClick={handleRegister}>
              Join now
            </Button>
          </div>
        </div>
      )}
      <div className="trending-container">
        <h2>NEW MOVIES</h2>
        <div className="movie-lists">
          {dataSource.map((movie, index) => (
            <div key={index + 1} className="movie-card">
              <span className="movie-number">{index + 1}</span>
              <img
                src={movie.thumbnail}
                alt={movie.title}
                className="movie-poster"
              />
              <h3 className="movie-titles">{movie.title}</h3>
            </div>
          ))}
        </div>
      </div>

      <div className="reasons-container">
        <h2>REASONS WHY YOU SHOULD JOIN NOW</h2>
        <div className="reasons-grid">
          {reasons.map((reason, index) => (
            <div key={index} className="reason-card">
              <p>{reason.text}</p>
              <br />
              <br />
              <span className="icon">{reason.icon}</span>
            </div>
          ))}
        </div>
      </div>
      <Footer />
    </div>
  );
}

export default HomePage;
