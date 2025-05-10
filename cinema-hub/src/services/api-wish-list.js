import axios from './custome-axios';
const checkUserFavorite = async (email, movieId) => {
    return await axios.get(`UserFavorite/accounts/${email}/movies/${movieId}/check-wishlist`);
};

const viewAllFavorite = async () => {
    return await axios.get(`UserFavorite/user-favorites`);
};

const viewUserFavorite = async (email, pageSize, id) => {
    return await axios.get(`UserFavorite/accounts/${email}/user-favorites`, {
        params: {
            pageSize: pageSize,
            favoriteId: id
        }
    });
};

const getMovieFavoriteByEmail = async (email, pageSize, id) => {
    return await axios.get(`UserFavorite/accounts/${email}/movie-wishlist-user`,{
        params: {
            pageSize: pageSize,
            favoriteId: id
        }
    });
};

const getMovieIdWish = async (email, pageSize, id) => {
    return await axios.get(`UserFavorite/accounts/${email}/movie-wishlist`,{
        params: {
            pageSize: pageSize,
            favoriteId: id
        }
    });
};

const addUserFavorite = async (email, movieId) => {
    return await axios.post(`UserFavorite/accounts/${email}/movies/${movieId}`);
};

const removeUserFavorite = async (email, movieId) => {
    return await axios.delete(`UserFavorite/accounts/${email}/movies/${movieId}`);
};

export {checkUserFavorite, viewAllFavorite, viewUserFavorite, getMovieFavoriteByEmail, addUserFavorite, removeUserFavorite, getMovieIdWish};