import { movieChange, movieSearch, movieDetail, movieSearchName } from "../reducers/movieSlice";
import { checkMovieAfterCreate, createNewMovie, deleteMovie, filterMovie, getGenreInMovieWishList, searchMovieByGenre, searchMovieById, searchMovieTitles, updateMovie, viewAllLanguage, viewAllMoviePending, viewAllMovies, viewAllMovieTitle, viewAllYear } from "../../services/api-movie";
// import { create } from "lodash";
import { createAsyncThunk } from "@reduxjs/toolkit";

//Action load movies
export const loadMovies = createAsyncThunk(
    'movie/loadMovies',
    async ({ status, pageSize, movieId }) => {
        try{
            const response = await viewAllMovies(status, pageSize, movieId);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);


//Action load pending movies
export const loadPendingMovies = createAsyncThunk(
    'movie/loadPendingMovies',
    async ({ pageSize, movieId }) => {
        try{
            const response = await viewAllMoviePending(pageSize, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

//Action search(redux)
export const searchMovieTitle = async (dispatch, search) => {
    dispatch(movieSearch(search));
};

//Action filter(api) + filter(redux)
export const movieChangeFilter = async (dispatch, genreName, language, year) => {
    const data = {
        language: language,
        genreName: genreName,
        year: year
    }
    dispatch(movieChange(data));
};

export const searchFilterMovie = createAsyncThunk(
    'movie/searchFilterMovie',
    async ({ genreName, language, year, pageSize, movieId }) => {
        try{
            const response = await filterMovie(genreName, language, year, pageSize, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const searchTitle = createAsyncThunk(
    'movie/searchTitle',
    async ({ title, pageSize, movieId }) => {
        try{
            const response = await searchMovieTitles(title, pageSize, movieId);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const viewMovieTitle = createAsyncThunk(
    'movie/viewMovieTitle',
    async () => {
        try{
            const response = await viewAllMovieTitle();
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

//Action movie detail
export const getMovieDetail = async (dispatch, id) => {
    dispatch(movieDetail(id));
};

export const getMovieDetailById = createAsyncThunk(
    'movie/getMovieDetailById',
    async ({id}) => {
        try{
            const response = await searchMovieById(id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

//Action movie relative suggestion
export const getMovieRelativeSuggestion = createAsyncThunk(
    'movie/getMovieRelativeSuggestion',
    async ({ genreName, id }) => {
        try{
            const response = await searchMovieByGenre(genreName, id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const getMovieYear = createAsyncThunk(
    'movie/getMovieYear',
    async () => {
        try{
            const response = await viewAllYear();
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const getMovieLanguage = createAsyncThunk(
    'movie/getMovieLanguage',
    async () => {
        try{
            const response = await viewAllLanguage();
            return response.data;
        } catch {
            return { error: true };
        }    
    }
);

export const getGenreNameWish = createAsyncThunk(
    'movie/getGenreNameWish',
    async ({ genreName }) => {
        try{
            const response = await getGenreInMovieWishList(genreName);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const createMovie = createAsyncThunk(
    'movie/createMovie',
    async (data) => {
        try{
            const response = await createNewMovie(data);
            return response.data;
        } catch {
            return { error: true };
        }
        
    }
);

export const checkMovie = createAsyncThunk(
    'movie/checkMovie',
    async ({ movieId, status }) => {
        try {
            const response = await checkMovieAfterCreate(movieId, status);
            return response.data;
        } catch {
            return { error: true };
        }      
    }
);

export const updateMovieInfo = createAsyncThunk(
    'movie/updateMovieInfo',
    async (data) => {
        try{
            const response = await updateMovie(data);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const deleteMovieInfo = createAsyncThunk(
    'movie/deleteMovieInfo',
    async ({ id }) => {
        try{
            const response = await deleteMovie(id);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const searchMovieName = (dispatch, name) => {
    dispatch(movieSearchName(name));
}

