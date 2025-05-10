import { createNewGenre, deleteGenre, updateGenre, viewAllGenres } from "../../services/api-movie-genre";
import { createAsyncThunk } from "@reduxjs/toolkit";

export const loadMovieGenres = createAsyncThunk(
    'movie/loadMovieGenres',
    async () => {
        try{
            const response = await viewAllGenres();
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const AddGenre = createAsyncThunk(
    'movie/AddGenre',
    async (data) => {
        try{
            const response = await createNewGenre(data);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const EditGenre = createAsyncThunk(
    'movie/EditGenre',
    async (data) => {
        try{
            const response = await updateGenre(data);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const removeGenre = createAsyncThunk(
    'movie/removeGenre',
    async ({id}) => {
        try{
            const response = await deleteGenre(id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

