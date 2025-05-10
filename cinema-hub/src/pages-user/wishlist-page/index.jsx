import { useEffect, useState } from "react";
import Footer from "../../components/footer";
import HeaderUser from "../../components/header/header-user";
import "./index.scss";
import {
  getMovieIdWishList,
  getMovieWishList,
  loadWishList,
  removeWishList,
} from "../../redux/actions/wishListAction";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import {
  getGenreNameWish,
  getMovieDetail,
} from "../../redux/actions/movieAction";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { debounce } from "lodash";

function WishList() {
  const navigate = useNavigate();
  const selector = useSelector((state) => state.wishList);
  const dispatch = useDispatch();
  const [wishList, setWishList] = useState([]);
  const [genre, setGenre] = useState([]);
  const [lastWishList, setLastWishList] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);
  const pageSize = 4; // Số bản ghi mỗi trang

  const loadWishListMovie = async (dispatch, email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastWishList === "") {
      if (selector.lastWishList !== 0 && lastWishList === "") {
        setLastWishList(selector.lastWishList);
        setWishList(selector.wishList);
      } else {
        const responseFavorite = await dispatch(
          getMovieWishList({
            email: email,
            pageSize: pageSize,
            id: "100000000",
          })
        );
        const response = await dispatch(
          loadWishList({ email: email, pageSize: pageSize, id: "100000000" })
        );
        if (
          response.payload.error === true &&
          responseFavorite.payload.error === true
        ) {
          setHasMore(false);
          return;
        }
        setLastWishList(
          response.payload.data[response.payload.data.length - 1].favoriteId
        );
        setWishList(responseFavorite.payload.data);
      }
    } else {
      const responseFavorite = await dispatch(
        getMovieWishList({ email: email, pageSize: pageSize, id: lastWishList })
      );
      const response = await dispatch(
        loadWishList({ email: email, pageSize: pageSize, id: lastWishList })
      );

      if (
        response.payload.error === true &&
        responseFavorite.payload.error === true
      ) {
        setHasMore(false);
        return;
      }

      setLastWishList(
        response.payload.data[response.payload.data.length - 1].favoriteId
      );
      setWishList((pre) => [...pre, ...responseFavorite.payload.data]);
    }
    setLoading(false);
  };

  const handleViewDetail = (movieId) => {
    getMovieDetail(dispatch, movieId);
    navigate(`/movie-detail`);
  };

  const handleRemoveWishList = async (movieId) => {
    const response = await dispatch(
      removeWishList({
        email: sessionStorage.getItem("email"),
        movieId: movieId,
      })
    );
    if (response.payload.success === true) {
      toast.success("Remove successfully");
      reloadState();
    }
  };

  const getListMovie = async (email, pageSize, id) => {
    const response = await dispatch(
      getMovieIdWishList({ email: email, pageSize: pageSize, id: id })
    );
    return response.payload;
  };

  const loadGenreWish = async (genre) => {
    let genreList = [];
    for (let i = 0; i < genre.length; i++) {
      genreList.push(genre[i]);
    }
    const param = {
      genreName: genreList,
    };
    const response = await dispatch(getGenreNameWish(param));
    return response.payload.data;
  };

  const loadGenre = async (dispatch, email, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastWishList === "") {
      const result = await getListMovie(email, pageSize, "100000000");
      const response = await loadGenreWish(result);

      if (result.length === 0) {
        setHasMore(false);
        return;
      }
      setGenre(response);
    } else {
      const result = await getListMovie(email, pageSize, lastWishList);
      const response = await loadGenreWish(result);

      if (result.length === 0) {
        setHasMore(false);
        return;
      }
      setGenre((pre) => [...pre, ...response]);
    }
    setLoading(false);
  };

  const reloadState = () => {
    setLoading(false);
    setHasMore(true);
    setLastWishList("");
    setWishList([]);
  };

  useEffect(() => {
    if (wishList.length == 0 && !loading) {
      loadWishListMovie(dispatch, sessionStorage.getItem("email"), pageSize);
      loadGenre(dispatch, sessionStorage.getItem("email"), pageSize);
      window.scrollTo(0, 0);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [wishList]);

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await loadWishListMovie(
        dispatch,
        sessionStorage.getItem("email"),
        pageSize
      );
      await loadGenre(dispatch, sessionStorage.getItem("email"), pageSize);
    }
  }, 500);

  useEffect(() => {
    if (sessionStorage.getItem("email") === null) {
      navigate("/login");
    }

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [selector.isChange, loading, lastWishList]);

  return (
    <>
      <HeaderUser />
      <div className="wishlist-container">
        <h1>Movie Wishlist</h1>
        {wishList.length > 0 ? (
          <div className="wishlist-grid">
            {wishList.map((item, index) => (
              <div className="wishlist-card luxury" key={index}>
                <img
                  src={item.thumbnail}
                  alt="Movie 1"
                  className="movie-poster"
                />
                <div className="movie-info">
                  <h3>{item.title}</h3>
                  <p>Director: {item.director}</p>
                  <p>Release Date: {item.releaseDate}</p>
                  <p>Genre: {genre[index]}</p>
                  <div className="wishlist-actions">
                    <button
                      className="details-button"
                      onClick={() => handleViewDetail(item.movieId)}
                    >
                      Details
                    </button>
                    <button
                      className="remove-button"
                      onClick={() => handleRemoveWishList(item.movieId)}
                    >
                      Remove
                    </button>
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <center className="no-wishlist">
            You do not have any movie viewing wish list yet.
          </center>
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

export default WishList;
