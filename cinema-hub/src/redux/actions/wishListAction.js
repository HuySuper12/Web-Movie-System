import { createAsyncThunk } from "@reduxjs/toolkit";
import { addUserFavorite, checkUserFavorite, getMovieFavoriteByEmail, getMovieIdWish, removeUserFavorite, viewUserFavorite } from "../../services/api-wish-list";

export const loadWishList = createAsyncThunk(
    "wishList/loadWishList",
    async ({ email, pageSize, id }) => {
        try{
            const response = await viewUserFavorite(email, pageSize, id);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);

export const getMovieWishList = createAsyncThunk(
    "wishList/getMovieWishList",
    async ({ email, pageSize, id }) => {
        try{
            const response = await getMovieFavoriteByEmail(email, pageSize, id);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);

export const getMovieIdWishList = createAsyncThunk(
    "wishList/getMovieIdWishList",
    async ({email, pageSize, id}) => {
        try{
            const response = await getMovieIdWish(email, pageSize, id);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);

export const addWishList = createAsyncThunk(
    "wishList/addWishList",
    async ({email, movieId}) => {
        try{
            const response = await addUserFavorite(email, movieId);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);

export const removeWishList = createAsyncThunk(
    "wishList/removeWishList",
    async ({email, movieId}) => {
        try{
            const response = await removeUserFavorite(email, movieId);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);

export const checkWishList = createAsyncThunk(
    "wishList/checkWishList",
    async ({email, movieId}) => {
        try{
            const response = await checkUserFavorite(email, movieId);
            return response.data;
        }catch{
            return { error: true };
        }
    }
);