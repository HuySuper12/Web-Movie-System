import axios from './custome-axios';

const viewAllMovies = async (status, pageSize, movieId) => {
    return await axios.get(`Movie/movies`, {
        params: {
          status: status,
          pageSize: pageSize,
          movieId: movieId
        }
    });
};


const viewAllMoviePending = async (pageSize, movieId) => {
    return await axios.get(`Movie/movies-pending`, {
        params: {
            pageSize: pageSize,
            movieId: movieId
        }
    });
};

const searchMovieById = async (id) => {
    return await axios.get(`Movie/${id}`);
};

const searchMovieByGenre = async (genreName, movieId) => {
    return await axios.get(`Movie/movies/${movieId}/genres/${genreName}`);
};

const searchMovieByLanguage = async (language) => {
    return await axios.get(`Movie/language/${language}`);
};

const filterMovie = async (genreName, language, year, pageSize, movieId) => {
    return await axios.get(`Movie/genre-language-year`,{
        params: {
            genreName: genreName,
            language: language,
            year: year,
            pageSize: pageSize,
            movieId: movieId
        }
    });
};

const searchMovieTitles = async (title, pageSize, movieId) => {
    return await axios.get(`Movie/title`,{
        params: {
            title: title,
            pageSize: pageSize,
            movieId: movieId
        }
    });
};

const viewAllMovieTitle = async () => {
    return await axios.get(`Movie/movies-title`);
};

const getGenreInMovieWishList = async (data) => {
    return await axios.post(`Movie/genre-wish`, data);
};

const createNewMovie = async (data) => {
    return await axios.post(`Movie`, data);
};

const checkMovieAfterCreate = async (movieId, status) => {
    return await axios.put(`Movie/moderation/${movieId}`, {}, {
        params: {
            status: status
        }
    });
};

const updateMovie = async (data) => {
    return await axios.put(`Movie`, data);
};

const deleteMovie = async (id) => { 
    return await axios.delete(`Movie/${id}`);
};

const viewAllYear = async () => {
    return await axios.get(`Movie/year`);
};

const viewAllLanguage = async () => {
    return await axios.get(`Movie/language`);
};

export { viewAllMovies, viewAllMoviePending, searchMovieById, searchMovieByGenre, searchMovieByLanguage, filterMovie, searchMovieTitles,viewAllMovieTitle, getGenreInMovieWishList, viewAllYear, viewAllLanguage, createNewMovie, checkMovieAfterCreate, updateMovie, deleteMovie };