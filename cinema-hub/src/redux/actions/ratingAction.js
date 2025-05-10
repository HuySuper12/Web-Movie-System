import { createAsyncThunk } from "@reduxjs/toolkit";
import { addRating, calulateRating, removeRating, viewAllRatingByMovieId, viewRatingStatistic } from "../../services/api-rating";

export const viewAllRatingsByMovieId = createAsyncThunk(
    "rating/viewAllRatingByMovieId",
    async ({ movieId, status, pageSize, commentId }) => {
        try {
            const response = await viewAllRatingByMovieId(movieId, status, pageSize, commentId);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const viewRatingStatisticAdmin = createAsyncThunk(
    "rating/viewRatingStatisticAdmin",
    async ({ status, pageSize, lastMovieId }) => {
        try {
            const response = await viewRatingStatistic(status, pageSize, lastMovieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const calulateMovieRating = createAsyncThunk(
    "rating/calulateMovieRating",
    async ({ movieId }) => {
        try {
            const response = await calulateRating(movieId);
            return response.data;
        } catch {
            return { error: true };
        }    
    }
);

export const addNewRating = createAsyncThunk(
    "rating/addNewRating",
    async (data) => {
        try {
            const response = await addRating(data);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const deleteRating = createAsyncThunk(
    "rating/deleteRating",
    async ({ ratingId }) => {
        try {
            const response = await removeRating(ratingId);
            return response.data;
        } catch {
            return { error: true };
        }    
    }
);