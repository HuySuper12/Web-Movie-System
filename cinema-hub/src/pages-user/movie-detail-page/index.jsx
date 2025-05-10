import HeaderUser from "../../components/header/header-user";
import Footer from "../../components/footer";
import "./index.scss";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  getMovieDetail,
  getMovieDetailById,
  getMovieRelativeSuggestion,
} from "../../redux/actions/movieAction";
import { useNavigate } from "react-router-dom";
import MoviePopup from "../../components/movie-popup";
import { addWishList, checkWishList } from "../../redux/actions/wishListAction";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  addHistory,
  checkMovieHistory,
  continueWatch,
  loadWatchHistoryDetail,
  updateHistory,
} from "../../redux/actions/watchHistoryAction";
import {
  addNewComment,
  deleteComment,
  viewAllCommentsByMovieId,
} from "../../redux/actions/commentAction";
import {
  addNewRating,
  calulateMovieRating,
  deleteRating,
  viewAllRatingsByMovieId,
} from "../../redux/actions/ratingAction";
import { viewProfileId } from "../../redux/actions/accountAction";
import { viewPaymentRemaining } from "../../redux/actions/paymentAction";

function MovieDetail() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.movie);
  const selectorWatchHistory = useSelector((state) => state.watchHistory);
  const selectorRating = useSelector((state) => state.rating);
  const selectorComment = useSelector((state) => state.comment);
  let movieGenreString = "";
  const [movieGenre, setMovieGenre] = useState("");
  const [movies, setMovies] = useState([]);
  const [movie, setMovie] = useState([]);
  const [trailers, setTrailers] = useState("");
  const [video, setVideo] = useState("");
  const [status, setStatus] = useState(false);
  const [showPopup, setShowPopup] = useState(false);
  const [statusWish, setStatusWish] = useState(false);
  const [progress, setProgress] = useState(0);
  const [commentList, setCommentList] = useState([]);
  const [ratingList, setRatingList] = useState([]);
  const [account, setAccount] = useState([]);
  const [paidSubscription, setPaidSubscription] = useState({});
  const [avg, setAvg] = useState(0);

  const movieId = selector.movieDetail; //Lay id tu redux state

  //Load movie detail
  const loadMovieHistory = async (email, movieId) => {
    const response = await dispatch(
      loadWatchHistoryDetail({ email: email, movieId: movieId })
    );
    if (response.payload.error === true) {
      setProgress(0);
      return;
    }
    setProgress(response.payload.data.progress);
  };

  const loadMovieDetail = async (id) => {
    const response = await dispatch(getMovieDetailById({ id: id }));
    setMovie(response.payload.data);
    for (let i = 0; i < response.payload.data.genres.length; i++) {
      if (i === 0) {
        movieGenreString += response.payload.data.genres[i].genreName;
      } else {
        movieGenreString += ", " + response.payload.data.genres[i].genreName;
      }
    }
    //Set trailer/video + video theo progress
    setTrailers(
      "https://www.youtube.com/embed/" + response.payload.data.trailerUrl
    );
    setVideo(
      "https://www.youtube.com/embed/" +
        response.payload.data.videoUrl +
        "?start=" +
        progress
    );

    setMovieGenre(movieGenreString);
    searchMovieRelative(dispatch, movieGenreString, movieId);
  };

  //Load movie relative
  const searchMovieRelative = async (dispatch, genreName, id) => {
    const param = { genreName: genreName, id: id };
    const response = await dispatch(getMovieRelativeSuggestion(param));
    setMovies(response.payload.data);
  };

  //Set movie relative
  const handleSetMovieId = (id) => {
    getMovieDetail(dispatch, id);
    setMovie(id);
  };

  //Them wishlist
  const handleAddWishlist = async (id) => {
    const response = await dispatch(
      addWishList({ email: sessionStorage.getItem("email"), movieId: id })
    );
    if (response.payload.success === true) {
      setStatusWish(true);
      toast.success("Add to wishlist successfully");
    } else {
      toast.error("Add to wishlist failed");
    }
  };

  const checkWish = async (dispatch, email, id) => {
    const response = await dispatch(
      checkWishList({ email: email, movieId: id })
    );
    setStatusWish(response.payload.data);
  };

  //Cap nhat va them lich su xem phim
  const handleCheckWatchedMovie = (movieId) => {
    if (sessionStorage.getItem("email") !== null) {
      //Kiem tra xem co dang ky goi dich vu hay khong
      if (paidSubscription != "" && sessionStorage.getItem("email") !== null) {
        setShowPopup(true);
        setStatus(true);
        handleAddWatchedMovie(movieId);
        localStorage.setItem("status", true);
      } else {
        navigate("/servicePackage");
      }
    } else {
      navigate("/login");
    }
  };

  const handleAddWatchedMovie = async (movieId) => {
    const response = await dispatch(
      checkMovieHistory({
        email: sessionStorage.getItem("email"),
        movieId: movieId,
      })
    );

    if (response.payload.error === true) {
      await dispatch(
        addHistory({ email: sessionStorage.getItem("email"), movieId: movieId })
      );
    } else {
      await dispatch(
        continueWatch({
          email: sessionStorage.getItem("email"),
          movieId: movieId,
        })
      );
    }
  };

  const handleUpdateWatchedMovie = async (movieId) => {
    //Do ham await update cham can cap nhat du lieu nen useEffect 2 lan (1 lan la selector, 1 lan la dong modal)
    //Cach giai quyet cap nhat cham la useEffect 2 lan lien tuc
    await dispatch(
      updateHistory({
        email: sessionStorage.getItem("email"),
        movieId: movieId,
      })
    );
  };

  //Xu ly so sao khi nguoi dung an vao sao va onChange comment
  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState("");

  const handleRating = (value) => {
    setRating(value);
  };

  const handleAddNewCommentRating = async () => {
    const data = {
      email: sessionStorage.getItem("email"),
      movieId: movieId,
      content: comment,
      rating1: rating,
    };

    if (comment === "" || rating === 0) {
      toast.error("Please enter comment and rating");
      return;
    }

    const response1 = await dispatch(addNewComment(data, dispatch));
    const response2 = await dispatch(addNewRating(data));
    if (
      response1.payload.success === true &&
      response2.payload.success === true
    ) {
      toast.success("Add comment and rating successfully");
      setComment("");
      setRating(0);
    } else {
      toast.error("Add comment and rating failed");
    }
    setAvg(0);
  };

  //Xoa comment va rating
  const handleRemoveCommentRating = async (id) => {
    const response1 = await dispatch(
      deleteComment({ commentId: id, dispatch })
    );
    const response2 = await dispatch(deleteRating({ ratingId: id }));
    if (
      response1.payload.success === true &&
      response2.payload.success === true
    ) {
      toast.success("Delete comment and rating successfully");
    } else {
      toast.error("Delete comment and rating failed");
    }
    setAvg(0); //Dung de reset lai sao dua tren su thay doi comment va rating
  };

  //Tinh rating trung binh
  const handleCalculate = async (movieId) => {
    const response = await dispatch(calulateMovieRating({ movieId: movieId }));
    if (response.payload.error === true) {
      setAvg(0.0);
      return;
    }
    setAvg(response.payload.data.toFixed(1));
  };

  //Load comment and rating user
  const loadCommentMovie = async (movieId, status, pageSize) => {
    const response = await dispatch(
      viewAllCommentsByMovieId({
        movieId,
        status,
        pageSize,
        commentId: "1000000",
      })
    );

    if (response.payload.error === true) {
      return;
    }

    //Dua cac account vao 1 mang
    let array = [];
    for (let i = 0; i < response.payload.data.length; i++) {
      const result = await handleViewProfile(response.payload.data[i].userId);
      array.push(result);
    }
    setAccount(array);
    setCommentList(response.payload.data);
  };

  const loadRatingMovie = async (movieId, status, pageSize) => {
    const response = await dispatch(
      viewAllRatingsByMovieId({
        movieId: movieId,
        status: status,
        pageSize: pageSize,
        commentId: "1000000",
      })
    );
    setRatingList(response.payload.data);
  };

  const handleViewProfile = async (id) => {
    const response = await dispatch(viewProfileId(id));
    return response.payload.data;
  };

  const handleViewAllComments = async () => {
    getMovieDetail(dispatch, movieId);
    navigate("/comment-rating");
  };

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

  //load goi dich vu
  const loadPaidSubscription = async (dispatch, email) => {
    const response = await dispatch(viewPaymentRemaining({ email: email }));
    setPaidSubscription(response.payload.data);
  };

  useEffect(() => {
    if (
      (commentList === "" && ratingList === "" && account === "") ||
      avg === 0
    ) {
      loadCommentMovie(movieId, true, 3);
      loadRatingMovie(movieId, true, 3);
      handleCalculate(movieId);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [commentList, ratingList, account, avg, selector.isChange]);

  useEffect(() => {
    if (selector.movieDetail === 0) {
      navigate("/movie-list");
    }

    loadMovieDetail(movieId);
    loadCommentMovie(movieId, true, 3);
    loadRatingMovie(movieId, true, 3);
    handleCalculate(movieId);
    if (sessionStorage.getItem("email") !== null) {
      checkWish(dispatch, sessionStorage.getItem("email"), movieId);
      loadMovieHistory(sessionStorage.getItem("email"), movieId);
      loadPaidSubscription(dispatch, sessionStorage.getItem("email"));
    }

    window.scrollTo(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [
    movieId,
    statusWish,
    selectorWatchHistory.isChange,
    showPopup,
    selectorComment.isChange,
    selectorRating.isChange,
    avg,
  ]);

  return (
    <>
      <HeaderUser />
      <div className="containers">
        {/* Header */}
        <div className="header-user">
          <img src={movie.thumbnail} alt={movie.title} className="poster" />
          <div className="info">
            <h1 className="title">{movie.title}</h1>
            <br />
            <center>
              <p>
                ⭐ <strong>{avg}</strong> / 5
              </p>
            </center>
            <br />
            <p>
              <strong>Movie Genres:</strong> {movieGenre}
            </p>
            <br />
            <p>
              <strong>Release Date:</strong> {movie.releaseDate}
            </p>
            <br />
            <p>
              <strong>Duration:</strong> {movie.duration} minutes
            </p>
            <br />
            <p>
              <strong>Director:</strong> {movie.director}
            </p>
            <br />
            <p>
              <strong>Quality:</strong> Full HD
            </p>
            <br />
            <p>
              <strong>Language :</strong> {movie.language}
            </p>
            <br />
            <p>
              <strong>Viewers:</strong> {movie.watchHistories?.length || 0}{" "}
              view(s)
            </p>
            <br />
            <div className="buttons">
              {sessionStorage.getItem("email") !== null &&
                statusWish == false && (
                  <button
                    className="wishlist-button"
                    onClick={() => handleAddWishlist(movie.movieId)}
                  >
                    WISHLIST
                  </button>
                )}
              <button
                className="trailer-button"
                onClick={() => {
                  setShowPopup(true);
                  setStatus(false);
                  localStorage.setItem("status", false);
                }}
              >
                Trailer
              </button>

              <button
                className="watch-button"
                onClick={() => handleCheckWatchedMovie(movie.movieId)}
              >
                Full Movie
              </button>
            </div>
          </div>
        </div>

        <div className="content">
          <h2 className="section-title">MOVIE CONTENTS</h2>
          <p className="description">{movie.description}</p>
        </div>

        <div className="comments-section">
          <h2 className="comments-title">USER REVIEWS & RATINGS</h2>

          <div className="rating-summary">
            <span className="rating-score">{avg}</span>
            <div className="stars">
              {[1, 2, 3, 4, 5].map((value) =>
                avg >= value ? (
                  <span className="star full" key={value}>
                    ★
                  </span>
                ) : (
                  <span className="star half" key={value}>
                    ☆
                  </span>
                )
              )}
            </div>
            <p className="total-reviews">
              Based on {movie.watchHistories?.length} reviews
            </p>{" "}
            {/* account.length: do so luong account ung voi so luong comment gocgoc */}
          </div>
          {commentList.length > 0
            ? commentList.map((comment, index) => (
                <div className="comment" key={index}>
                  <div className="reviews">
                    <div className="user-info">
                      <img
                        src={account[index].profilePicture}
                        alt="Avatar"
                        className="avatar"
                      />
                      <div>
                        <p className="user-name">{account[index].fullName}</p>
                        <p className="comment-date">
                          {formatDate(comment.createdAt)}
                        </p>
                      </div>
                    </div>

                    <div className="user-rating">
                      {ratingList &&
                      ratingList[index] &&
                      ratingList[index].rating1 !== undefined ? (
                        <>
                          {[1, 2, 3, 4, 5].map((value) =>
                            value <= ratingList[index].rating1 ? (
                              <span className="user-stars" key={value}>
                                ★
                              </span>
                            ) : (
                              <span className="user-stars" key={value}>
                                ☆
                              </span>
                            )
                          )}
                          <span className="user-score">
                            {ratingList[index].rating1}/5
                          </span>
                        </>
                      ) : (
                        <span>Rating not available</span>
                      )}
                    </div>
                  </div>
                  <p className="comment-text">{comment.content}</p>
                  {sessionStorage.getItem("email") === account[index].email && (
                    <div style={{ display: "flex", justifyContent: "right" }}>
                      <button
                        className="delete-btn"
                        onClick={() => {
                          handleRemoveCommentRating(comment.commentId);
                        }}
                      >
                        Delete
                      </button>
                    </div>
                  )}
                </div>
              ))
            : sessionStorage.getItem("email") !== null && (
                <p className="no-comment">
                  You will be the first to comment on this movie
                </p>
              )}
          <div className="view-all-comments">
            <button className="btn-view-all" onClick={handleViewAllComments}>
              View all comments
            </button>
          </div>

          <div className="distance"></div>
          {sessionStorage.getItem("email") !== null && (
            <div className="add-comment">
              <textarea
                value={comment}
                onChange={(e) => setComment(e.target.value)}
                placeholder="Write your comment here..."
                className="comment-input"
              ></textarea>
              <div className="add-rating">
                <div className="add-rating">
                  <label className="rating-label">Your Rating:</label>
                  <div className="rating-stars">
                    {[1, 2, 3, 4, 5].map((value) => (
                      <button
                        key={value}
                        className={`star-button ${
                          value <= rating ? "active" : ""
                        }`}
                        onClick={() => handleRating(value)}
                      >
                        <span className="star">&#9733;</span>
                      </button>
                    ))}
                  </div>
                </div>
              </div>
              <center>
                <button
                  className="submit-btn"
                  onClick={handleAddNewCommentRating}
                >
                  Submit
                </button>
              </center>
            </div>
          )}
        </div>

        <div className="trending-containers">
          <h2>YOU MIGHT ALSO LIKE</h2>
          <div className="movie-list">
            {movies.map((movie, index) => (
              <div
                key={index + 1}
                className="movie-card"
                onClick={() => handleSetMovieId(movie.movieId)}
              >
                <img
                  src={movie.thumbnail}
                  alt={movie.title}
                  className="movie-poster"
                />
                <h3 className="movie-title">{movie.title}</h3>
              </div>
            ))}
          </div>
        </div>

        <MoviePopup
          show={showPopup}
          movieTitle={movie.title}
          videoUrl={status === true ? video : trailers} // Replace with your video URL
          onClose={async () => {
            if (
              sessionStorage.getItem("email") !== null &&
              localStorage.getItem("status") === "true"
            ) {
              await handleUpdateWatchedMovie(movie.movieId);
            }
            setShowPopup(false);
            localStorage.removeItem("status");
          }}
        />
      </div>
      <Footer />
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
    </>
  );
}

export default MovieDetail;
