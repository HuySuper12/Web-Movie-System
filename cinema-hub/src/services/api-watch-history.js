import axios from './custome-axios';

const viewWatchHistoryDetail = async (email, movieId) => {
    return await axios.get(`WatchHistory/accounts/${email}/movies/${movieId}/check-user`);
};

const viewAllWatchHistory = async () => {
    return await axios.get(`WatchHistory/watch-history`);
};

const viewUserWatchHistory = async (email, pageSize, id) => {
    return await axios.get(`WatchHistory/accounts/${email}/watch-history/user`,{
        params: {
            pageSize: pageSize,
            id: id
        }
    });
};

const viewMovieInWatchHistory = async (email, pageSize, id) => {
    return await axios.get(`WatchHistory/accounts/${email}/watch-history/movies`,{
        params: {
            pageSize: pageSize,
            id: id
        }
    });
};

const userLastWatchHistory = async (email, movieId) => {
    return await axios.get(`WatchHistory/accounts/${email}/movies/${movieId}/user-last`);
};

const addUserWatchHistory = async (email, movieId) => {
    return await axios.post(`WatchHistory/accounts/${email}/movies/${movieId}/add`);
};

const continueWatching = async (email, movieId) => {
    return await axios.post(`WatchHistory/accounts/${email}/movies/${movieId}/continue`);
};

const updateUserWatchHistory = async (email, movieId) => {
    return await axios.put(`WatchHistory/accounts/${email}/movies/${movieId}`);
};

const removeUserWatchHistory = async (id) => {
    return await axios.delete(`WatchHistory/${id}`);
};

const countViewWatchHistory = async (search) => {
    return await axios.get(`WatchHistory/watch-history/total-view`,{
        params: {
            search: search
        }
    });
};

export {viewWatchHistoryDetail, viewAllWatchHistory, viewUserWatchHistory, viewMovieInWatchHistory, userLastWatchHistory, addUserWatchHistory, continueWatching, updateUserWatchHistory, removeUserWatchHistory, countViewWatchHistory};