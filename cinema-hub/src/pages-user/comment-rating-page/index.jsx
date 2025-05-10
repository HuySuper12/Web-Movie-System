import { useEffect, useState } from "react";
import "./index.scss";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import { useDispatch, useSelector } from "react-redux";
import { getMovieDetailById } from "../../redux/actions/movieAction";
import { useNavigate } from "react-router-dom";
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
import { Bounce, toast, ToastContainer } from "react-toastify";
import { debounce } from "lodash";

function CommentRatingDetail() {
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.movie);
  // const selectorComment = useSelector((state) => state.comment);
  // const selectorRating = useSelector((state) => state.rating);
  const navigate = useNavigate();

  const [movie, setMovie] = useState([]);
  const [commentList, setCommentList] = useState([]);
  const [ratingList, setRatingList] = useState([]);
  const [genreName, setGenreName] = useState("");
  const [account, setAccount] = useState([]);
  const [avg, setAvg] = useState(0);
  const pageSize = 2; // So comment va rating moi lan load
  //Load sao chon truoc khi add comment + addcomment rating
  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState("");

  const [lastRating, setLastRating] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

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
      restoreState();
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
      restoreState();
    } else {
      toast.error("Delete comment and rating failed");
    }
    setAvg(0);
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

  //Load thong tin movie
  const movieId = selector.movieDetail;
  const loadMovie = async (id) => {
    // const response = await getMovieDetailById(dispatch, id);
    const param = { id: id };
    const response = await dispatch(getMovieDetailById(param));
    let genreString = "";
    for (let i = 0; i < response.payload.data.genres.length; i++) {
      if (i === response.payload.data.genres.length - 1) {
        genreString += response.payload.data.genres[i].genreName;
      } else {
        genreString += response.payload.data.genres[i].genreName + ", ";
      }
    }
    setGenreName(genreString);
    setMovie(response.payload.data);
  };

  //Load comment and rating
  const loadCommentRating = async (movieId, status, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastRating === "") {
      const responseComment = await dispatch(
        viewAllCommentsByMovieId({
          movieId: movieId,
          status: status,
          pageSize: pageSize,
          commentId: "1000000",
        })
      );

      if (responseComment.payload.error === true) {
        return;
      }

      //Dua cac account vao 1 mang
      let array = [];
      for (let i = 0; i < responseComment.payload.data.length; i++) {
        const result = await handleViewProfile(
          responseComment.payload.data[i].userId
        );
        array.push(result);
      }
      setAccount(array);
      setCommentList(responseComment.payload.data);

      const responseRating = await dispatch(
        viewAllRatingsByMovieId({
          movieId: movieId,
          status: status,
          pageSize: pageSize,
          commentId: "1000000",
        })
      );
      setLastRating(
        responseRating.payload.data[responseRating.payload.data.length - 1]
          .ratingId
      );
      setRatingList(responseRating.payload.data);
    } else {
      const responseComment = await dispatch(
        viewAllCommentsByMovieId({
          movieId: movieId,
          status: status,
          pageSize: pageSize,
          commentId: lastRating,
        })
      );

      //Check if there are no more comments
      if (responseComment.payload.error === true) {
        setHasMore(false);
        return;
      }

      //Dua cac account vao 1 mang
      let array = [];
      for (let i = 0; i < responseComment.payload.data.length; i++) {
        const result = await handleViewProfile(
          responseComment.payload.data[i].userId
        );
        array.push(result);
      }
      setAccount((pre) => [...pre, ...array]);
      setCommentList((pre) => [...pre, ...responseComment.payload.data]);

      const responseRating = await dispatch(
        viewAllRatingsByMovieId({
          movieId: movieId,
          status: status,
          pageSize: pageSize,
          commentId: lastRating,
        })
      );

      setLastRating(
        responseRating.payload.data[responseRating.payload.data.length - 1]
          .ratingId
      );
      setRatingList((pre) => [...pre, ...responseRating.payload.data]);
    }
    setLoading(false);
  };

  const restoreState = () => {
    setCommentList([]);
    setRatingList([]);
    setAccount([]);
    setHasMore(true);
    setLoading(false);
    setLastRating("");
    setAvg(0); //Dung de reset lai sao dua tren su thay doi comment va rating
  };

  //Day la ham xu ly scroll lazy load
  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await loadCommentRating(movieId, true, pageSize);
    }
  }, 500);

  useEffect(() => {
    if (
      (commentList.length === 0 &&
        ratingList.length === 0 &&
        account.length === 0) ||
      avg === 0
    ) {
      loadCommentRating(movieId, true, pageSize);
      handleCalculate(movieId);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [
    commentList.length,
    ratingList.length,
    account.length,
    avg,
    selector.isChange,
  ]);

  const handleViewProfile = async (id) => {
    const response = await dispatch(viewProfileId(id));
    return response.payload.data;
  };

  const formatDate = (createdAt) => {
    if (!createdAt) return "Unknown Date"; // Nếu không có giá trị, trả về chuỗi mặc định
    const date = new Date(createdAt);
    return `${date.getDate()} / ${date.getMonth() + 1} / ${date.getFullYear()}`; // Ngày/Tháng/Năm
  };

  useEffect(() => {
    if (movieId === 0) {
      navigate("/movie-list");
    }
    loadMovie(movieId);
    handleCalculate(movieId);
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, commentList.length, ratingList.length]);

  return (
    <>
      <HeaderUser />
      <div className="app">
        {/* Thông tin phim */}
        <div className="movie-info-rating">
          <img
            src={movie.thumbnail}
            alt={movie.title}
            className="poster-rating"
          />
          <div className="movie-details-rating">
            <h1>{movie.title}</h1>
            <ul>
              <li>
                <strong>Release Date:</strong> {movie.releaseDate}
              </li>
              <li>
                <strong>Director:</strong> {movie.director}
              </li>
              <li>
                <strong>Genres:</strong> {genreName}
              </li>
              <li>
                <strong>Duration:</strong> {movie.duration}
              </li>
            </ul>
            <button
              className="submit-btn"
              onClick={() => navigate("/movie-detail")}
            >
              Back to movie detail
            </button>
          </div>
        </div>

        {/* Phần chi tiết bình luận */}
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
            </p>
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
                        onClick={() =>
                          handleRemoveCommentRating(comment.commentId)
                        }
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
          <div>
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

export default CommentRatingDetail;
