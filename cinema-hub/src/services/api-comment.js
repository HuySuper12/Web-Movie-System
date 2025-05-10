import axios from './custome-axios';

const viewAllComment = async (pageSize, commentId) => {
    return await axios.get(`Comment/comments`, {
        params: {
          pageSize,
          commentId
        }});
};

const viewAllCommentByMovieId = async (movieId, status, pageSize, commentId) => {
    return await axios.get(`Comment/movies/${movieId}/comments`,{
        params: {
            pageSize: pageSize,
            commentId: commentId
        }
    });
};

const viewCommentDetail = async (commentId) => {
    return await axios.get(`Comment/${commentId}`);
};

const addComment = async (data) => {
    return await axios.post(`Comment`, data);
};

const removeComment = async (commentId) => {
    return await axios.delete(`Comment/${commentId}`); 
};

export { viewAllComment, viewAllCommentByMovieId, viewCommentDetail, addComment, removeComment };