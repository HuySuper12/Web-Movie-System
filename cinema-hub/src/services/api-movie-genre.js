import axios from './custome-axios';

const viewAllGenres = async () => {
    return await axios.get(`MovieGenre/genres`);
};

const getGenreById = async (id) => {
    return await axios.get(`MovieGenre/${id}`);
};

const getGenreByName = async (name) => {
    return await axios.get(`MovieGenre/genres/by-genre-name`, {
        params: {
            name: name
        }
    });
};

const createNewGenre = async (data) => {
    return await axios.post(`MovieGenre`, data);
};

const updateGenre = async (data) => {
    return await axios.put(`MovieGenre`, data);
};

const deleteGenre = async (id) => {
    return await axios.delete(`MovieGenre/${id}`);
};

export { viewAllGenres, getGenreById, getGenreByName, createNewGenre, updateGenre, deleteGenre };