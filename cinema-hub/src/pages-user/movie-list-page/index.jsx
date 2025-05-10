import { useEffect, useState } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import { debounce } from "lodash";
import "./index.scss";
import {
  getMovieDetail,
  loadMovies,
  searchFilterMovie,
  searchTitle,
} from "../../redux/actions/movieAction";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import SideBarUser from "../../components/side-bar-user";
import "font-awesome/css/font-awesome.min.css";

const MoviesList = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.movie);
  const [movies, setMovie] = useState([]);
  const [lastMovies, setLastMovies] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const pageSize = 9; // Số bản ghi mỗi trang

  //Format Date
  const formatDate = (createdAt) => {
    if (!createdAt) return "Unknown Date"; // Nếu không có giá trị, trả về chuỗi mặc định
    const date = new Date(createdAt);
    const formatTwoDigits = (num) => String(num).padStart(2, "0");
    return `${formatTwoDigits(date.getDate())}/${formatTwoDigits(
      date.getMonth() + 1
    )}/${date.getFullYear()}`; // Ngày/Tháng/Năm Giờ:Phút:Giây
  };

  //Load movies
  //Tuan theo nguyen tac cua redux toolkit
  const fetchMovies = async (status, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastMovies === "") {
      //Load redux state
      if (selector.lastMovieId !== 0 && movies.length === 0) {
        setLastMovies(selector.lastMovieId);
        setMovie(selector.movie);
      } else {
        //Load lan dau
        const param = {
          status: status,
          pageSize: pageSize,
          movieId: "1000000",
        };
        const response = await dispatch(loadMovies(param));
        setLastMovies(
          response.payload.data[response.payload.data.length - 1].movieId
        );
        setMovie(response.payload.data);
      }
    } else {
      const param = { status: status, pageSize: pageSize, movieId: lastMovies };
      const response = await dispatch(loadMovies(param));
      //Check if there are no more movies
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }
      setLastMovies(
        response.payload.data[response.payload.data.length - 1].movieId
      );
      setMovie((pre) => [...pre, ...response.payload.data]);
    }

    setLoading(false); // Reset trạng thái loading
  };

  //Filter movies
  const fetchMovieFilter = async (genreName, language, year, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastMovies === "") {
      const param = {
        genreName: genreName,
        language: language,
        year: year,
        pageSize: pageSize,
        movieId: "1000000",
      };
      const response = await dispatch(searchFilterMovie(param));

      //Check if there are no more movies
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      setLastMovies(
        response.payload.data[response.payload.data.length - 1].movieId
      );
      setMovie(response.payload.data);
    } else {
      const param = {
        genreName: genreName,
        language: language,
        year: year,
        pageSize: pageSize,
        movieId: lastMovies,
      };
      const response = await dispatch(searchFilterMovie(param));

      //Check if there are no more movies
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      setLastMovies(
        response.payload.data[response.payload.data.length - 1].movieId
      );
      setMovie((pre) => [...pre, ...response.payload.data]);
    }
    setLoading(false); // Reset trạng thái loading
  };

  //Search movies by title
  const searchMovieTitle = async (search, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (search === "") {
      fetchMovies(true, pageSize);
    } else {
      if (lastMovies === "") {
        const param = {
          title: search,
          pageSize: pageSize,
          movieId: "1000000",
        };
        const response = await dispatch(searchTitle(param));

        //Check if there are no more movies
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        setLastMovies(
          response.payload.data[response.payload.data.length - 1].movieId
        );
        setMovie(response.payload.data);
      } else {
        const param = {
          title: search,
          pageSize: pageSize,
          movieId: lastMovies,
        };
        const response = await dispatch(searchTitle(param));
        //Check if there are no more movies
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        setLastMovies(
          response.payload.data[response.payload.data.length - 1].movieId
        );
        setMovie((pre) => [...pre, ...response.payload.data]);
      }
    }
    setLoading(false); // Reset trạng thái loading
  };

  //Get Movie detail
  const handleGetMovieDetail = (id) => {
    getMovieDetail(dispatch, id);
    navigate("/movie-detail");
  };

  //Day la ham xu ly scroll lazy load
  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      if (selector.search !== "") {
        await searchMovieTitle(selector.search, pageSize);
      } else {
        //Filter by genre, language, year
        if (
          selector.filter.language === "null" &&
          selector.filter.genreName === "null" &&
          selector.filter.year === 0
        ) {
          await fetchMovies(true, pageSize);
        } else {
          await fetchMovieFilter(
            selector.filter.genreName,
            selector.filter.language,
            selector.filter.year,
            pageSize
          );
        }
      }
    }
  }, 500);

  const resetState = () => {
    setLoading(false); // Reset trạng thái loading
    setHasMore(true); // Cho phép tải thêm dữ liệu
    setLastMovies(""); // Reset trạng thái phim cuối cùng
    setMovie([]); // Reset danh sách phim
  };

  //UseEffect này sẽ chạy mỗi khi selector thay đổi
  useEffect(() => {
    resetState();
  }, [selector.isChange]);

  //UseEffect này sẽ chạy mỗi khi danh sách phim thay đổi
  useEffect(() => {
    if (movies.length === 0) {
      if (selector.search !== "") {
        //Search by title
        searchMovieTitle(selector.search, pageSize);
      } else {
        if (
          selector.filter.language === "null" &&
          selector.filter.genreName === "null" &&
          selector.filter.year === 0
        ) {
          fetchMovies(true, pageSize);
        } else {
          fetchMovieFilter(
            selector.filter.genreName,
            selector.filter.language,
            selector.filter.year,
            pageSize
          );
        }
      }
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [movies]);

  //UseEffect này sẽ chạy mỗi khi scroll
  useEffect(() => {
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, lastMovies]);

  return (
    <>
      <HeaderUser />
      <div className="movies-list-container">
        <div className="sidebar-container">
          <SideBarUser />
        </div>
        <div className="movies-grid">
          {movies.map((movie, index) => (
            <div className="movie-card" key={index}>
              <img
                src={movie.thumbnail}
                alt={movie.title}
                className="movie-image"
                onClick={() => handleGetMovieDetail(movie.movieId)}
              />
              <div
                className="movie-overlay"
                onClick={() => handleGetMovieDetail(movie.movieId)}
              >
                <div className="movie-title">{movie.title}</div>
                <div className="movie-year">
                  {formatDate(movie.releaseDate)}
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
      {window.innerHeight + window.scrollY >= document.body.offsetHeight - 500
        ? hasMore && (
            <div className="loading-container">
              <div className="spinner"></div>
              <p className="loading-text">Please wait...</p>
            </div>
          )
        : null}
      <Footer />
    </>
  );
};

export default MoviesList;
