import axios from './custome-axios';

const viewRatingStatistic = async (status, pageSize,
    lastMovieId) => {
    return await axios.get(`Rating/ratings/statistic`,{
        params: {
            status: status,
            pageSize: pageSize,
            movieId: lastMovieId
        }
    });
};

const viewAllRating = async () => {
    return await axios.get(`Rating/ratings`);
};

const viewAllRatingByMovieId = async (movieId, status, pageSize, ratingId) => {
    return await axios.get(`Rating/movies/${movieId}/ratings`, {
        params: {
            pageSize: pageSize,
            ratingId: ratingId
        }
    });
};

const viewRatingDetail = async (ratingId) => {
    return await axios.get(`Rating/${ratingId}`);
}

const calulateRating = async (movieId) => {
    return await axios.get(`Rating/movies/${movieId}/ratings/average`);
};

const addRating = async (data) => {
    return await axios.post(`Rating`, data);
};

const removeRating = async (ratingId) => {
    return await axios.delete(`Rating/${ratingId}`);
};

export { viewAllRating, viewRatingStatistic, viewAllRatingByMovieId, viewRatingDetail, calulateRating, addRating, removeRating };