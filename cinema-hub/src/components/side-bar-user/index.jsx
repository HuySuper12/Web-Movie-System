import "./index.scss";
import { useEffect, useState } from "react";
import { loadMovieGenres } from "../../redux/actions/movieGenreAction";
import { useDispatch, useSelector } from "react-redux";
import {
  getMovieLanguage,
  getMovieYear,
  movieChangeFilter,
  searchMovieTitle,
} from "../../redux/actions/movieAction";

function SideBarUser() {
  const [movieGenres, setMovieGenres] = useState([]);
  const [selectedGenre, setSelectedGenre] = useState("null");
  const [selectedLanguage, setSelectedLanguage] = useState("null");
  const [selectedYear, setSelectedYear] = useState(0);
  // eslint-disable-next-line no-unused-vars
  const [search, setSearch] = useState("");
  const [yearList, setYearList] = useState([]);
  const [languageList, setLanguageList] = useState([]);

  const dispatch = useDispatch();
  const seletor = useSelector((state) => state.movie);

  const handleSearch = (data) => {
    const value = data;

    if (value === "") {
      setSearch("");
      searchMovieTitle(dispatch, value);
      return;
    }

    setSearch(value);
    searchMovieTitle(dispatch, value);
  };

  //Filter
  const handleSetLanguage = (event) => {
    setSelectedLanguage(event.target.value);
    movieChangeFilter(
      dispatch,
      selectedGenre,
      event.target.value,
      selectedYear
    );
  };

  const handleSetGenreName = (event) => {
    setSelectedGenre(event.target.value);
    movieChangeFilter(
      dispatch,
      event.target.value,
      selectedLanguage,
      selectedYear
    );
  };

  const handleSetYear = (event) => {
    setSelectedYear(event.target.value);
    movieChangeFilter(
      dispatch,
      selectedGenre,
      selectedLanguage,
      event.target.value
    );
  };

  const fetchMovieGenres = async () => {
    const response = await dispatch(loadMovieGenres());
    setMovieGenres(response.payload.data);
  };

  const fetchYearList = async () => {
    const response = await dispatch(getMovieYear());
    setYearList(response.payload.data);
  };

  const fetchLanguageList = async (dispatch) => {
    // const response = await getMovieLanguage(dispatch);
    const response = await dispatch(getMovieLanguage());
    setLanguageList(response.payload.data);
  };

  useEffect(() => {
    fetchMovieGenres(dispatch);
    fetchYearList(dispatch);
    fetchLanguageList(dispatch);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div className="sidebar">
      {/* Header */}
      <div className="sidebar-header">
        <h3>CATEGORY</h3>
      </div>

      {/* Search */}
      <div className="search-section">
        <h4>Search Movie</h4>
        <input
          type="text"
          placeholder="Tìm kiếm phim..."
          value={seletor.search}
          onChange={(event) => handleSearch(event.target.value)}
        />
      </div>

      {/* Filter Section */}
      <div className="filter-section">
        <h4>Filter Movie</h4>
        <div className="filter-item">
          <label>Movie GenresGenres</label>
          <select
            id="filterCategory"
            value={seletor.filter.genreName}
            onChange={(event) => handleSetGenreName(event)}
          >
            <option value={"null"}>All Genres</option>
            {movieGenres.map((genre) => (
              <option key={genre.genreId} value={genre.genreName}>
                {genre.genreName}
              </option>
            ))}
          </select>
        </div>
        <div className="filter-item">
          <label>Movie Language</label>
          <select
            id="filterCountry"
            value={seletor.filter.language}
            onChange={(event) => handleSetLanguage(event)}
          >
            <option value="null">All Languages</option>
            {languageList.map((language) => (
              <option key={language} value={language}>
                {language}
              </option>
            ))}
          </select>
        </div>
        <div className="filter-item">
          <label>Movie Year</label>
          <select
            id="filterYear"
            value={seletor.filter.year}
            onChange={(event) => handleSetYear(event)}
          >
            <option value="0">All Years</option>
            {yearList.map((year) => (
              <option key={year} value={year}>
                {year}
              </option>
            ))}
          </select>
        </div>
      </div>

      {/* Footer */}
      <div className="sidebar-footer">
        <p>© 2024 Sidebar</p>
      </div>
    </div>
  );
}

export default SideBarUser;
