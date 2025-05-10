import HeaderUser from "../../components/header/header-user";
import Footer from "../../components/footer";
import { useEffect, useState } from "react";
import "./index.scss";
import {
  loadMovieInHistory,
  loadWatchHistory,
} from "../../redux/actions/watchHistoryAction";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { getMovieDetail } from "../../redux/actions/movieAction";
import { debounce } from "lodash";

function WatchHistory() {
  const navigate = useNavigate();
  const selector = useSelector((state) => state.watchHistory);
  const dispatch = useDispatch();
  const pageSize = 8; // Số bản ghi mỗi trang
  const [history, setHistory] = useState([]);
  const [moviesHistory, setMoviesHistory] = useState([]);
  const [lastHistory, setLastHistory] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  const fetchWatchHistory = async (email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastHistory === "") {
      if (selector.lastHistory !== 0 && lastHistory === "") {
        setLastHistory(selector.lastHistory.toString());
        setHistory(selector.watchHistory);
      } else {
        const response = await dispatch(
          loadWatchHistory({
            email: email,
            pageSize: pageSize,
            id: "1000000000",
          })
        );

        if (response.payload.data.length === 0) {
          setHasMore(false);
          return;
        }
        setLastHistory(
          response.payload.data[response.payload.data.length - 1].historyId
        );
        setHistory(response.payload.data);
      }
    } else {
      const response = await dispatch(
        loadWatchHistory({ email: email, pageSize: pageSize, id: lastHistory })
      );
      if (response.payload.data.length === 0) {
        setHasMore(false);
        return;
      }
      setLastHistory(
        response.payload.data[response.payload.data.length - 1].historyId
      );
      setHistory((pre) => [...pre, ...response.payload.data]);
    }
    setLoading(false);
  };

  const fetchMovieInHistory = async (email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastHistory === "") {
      if (selector.lastHistory !== 0 && lastHistory === "") {
        setMoviesHistory(selector.movieInHistory);
      } else {
        const response = await dispatch(
          loadMovieInHistory({
            email: email,
            pageSize: pageSize,
            id: "1000000000",
          })
        );
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }
        setMoviesHistory(response.payload.data);
      }
    } else {
      const response = await dispatch(
        loadMovieInHistory({
          email: email,
          pageSize: pageSize,
          id: lastHistory,
        })
      );
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }
      setMoviesHistory((pre) => [...pre, ...response.payload.data]);
    }
    setLoading(false);
  };

  const handleWatchAt = (date) => {
    // Xử lý định dạng nếu thiếu phần mili giây
    if (typeof date === "string" && !date.includes(".")) {
      date = date + ".000";
    }

    const watchedDate = new Date(date);
    // Kiểm tra tính hợp lệ của ngày
    if (isNaN(watchedDate.getTime())) {
      return "Invalid date";
    }

    const now = new Date();
    const diffTime = now - watchedDate;
    const diffSeconds = Math.floor(diffTime / 1000);
    const diffMinutes = Math.floor(diffSeconds / 60);
    const diffHours = Math.floor(diffMinutes / 60);
    const diffDays = Math.floor(diffHours / 24);
    const diffMonths = Math.floor(diffDays / 30);
    const diffYears = Math.floor(diffDays / 365);

    if (diffSeconds < 60) {
      return `${diffSeconds} seconds ago`;
    } else if (diffMinutes < 60) {
      return `${diffMinutes} minutes ago`;
    } else if (diffHours < 24) {
      return `${diffHours} hours ago`;
    } else if (diffDays < 30) {
      return `${diffDays} days ago`;
    } else if (diffMonths < 12) {
      return `${diffMonths} months ago`;
    } else {
      return `${diffYears} years ago`;
    }
  };

  const handleMovieDetail = async (movieId) => {
    await getMovieDetail(dispatch, movieId);
    navigate("/movie-detail");
  };

  const historyItem = (item) => {
    return history.find((h) => h.movieId === item.movieId);
  };

  //Day la ham xu ly scroll lazy load
  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await fetchWatchHistory(sessionStorage.getItem("email"), pageSize);
      await fetchMovieInHistory(sessionStorage.getItem("email"), pageSize);
    }
  }, 500);

  useEffect(() => {
    if (lastHistory.length === 0) {
      fetchWatchHistory(sessionStorage.getItem("email"), pageSize);
      fetchMovieInHistory(sessionStorage.getItem("email"), pageSize);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [history, moviesHistory]);

  useEffect(() => {
    if (sessionStorage.getItem("email") == null) {
      navigate("/login");
    }

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, lastHistory]);

  return (
    <>
      <HeaderUser />
      <div className="watch-history-page">
        <h2 className="page-title">Movie History</h2>
        {moviesHistory.length > 0 ? (
          <div className="history-container">
            {moviesHistory.map((item, index) => (
              <div
                className="movie-cards"
                key={index}
                onClick={() => handleMovieDetail(item.movieId)}
              >
                {/* Thêm poster phim */}
                <div className="movie-poster-wrapper">
                  <img
                    src={item.thumbnail}
                    alt={item.title}
                    className="movie-poster-history"
                  />
                </div>
                <div className="movie-infos">
                  <h3 className="movie-title-history">{item.title}</h3>
                  <p className="watch-time">
                    <strong>Last Watched:</strong>{" "}
                    {handleWatchAt(historyItem(item)?.watchedAt)}
                  </p>
                  <p className="status">
                    Status:
                    {historyItem(item)?.progress === 0
                      ? " Finish"
                      : " Continue"}
                  </p>
                  {historyItem(item)?.progress != 0 && (
                    <div className="actions">
                      <button
                        className="continue-btn"
                        onClick={() => handleMovieDetail(item.movieId)}
                      >
                        Continue
                      </button>
                    </div>
                  )}
                </div>
              </div>
            ))}
          </div>
        ) : (
          <p className="no-history">
            You do not have any movie viewing history yet.
          </p>
        )}
        {window.innerHeight + window.scrollY >= document.body.offsetHeight - 500
          ? hasMore && (
              <div className="loading-container">
                <div className="spinner"></div>
                <p className="loading-text">Please wait...</p>
              </div>
            )
          : null}
      </div>
      <Footer />
    </>
  );
}

export default WatchHistory;
