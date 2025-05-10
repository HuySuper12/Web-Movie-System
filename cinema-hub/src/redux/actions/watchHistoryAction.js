import { createAsyncThunk } from "@reduxjs/toolkit";
import { addUserWatchHistory, continueWatching, countViewWatchHistory, updateUserWatchHistory, userLastWatchHistory, viewMovieInWatchHistory, viewUserWatchHistory, viewWatchHistoryDetail } from "../../services/api-watch-history";


export const loadWatchHistory = createAsyncThunk(
    "watchHistory/loadWatchHistory",
    async ({ email, pageSize, id }) => {
        try {
            const response = await viewUserWatchHistory(email, pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const loadMovieInHistory = createAsyncThunk(
    "watchHistory/loadMovieInHistory",
    async ({ email, pageSize, id }) => {
        try {
            const response = await viewMovieInWatchHistory(email, pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const loadWatchHistoryDetail = createAsyncThunk(
    "watchHistory/loadWatchHistoryDetail",
    async ({ email, movieId }) => {
        try {
            const response = await userLastWatchHistory(email, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const addHistory = createAsyncThunk(
    "watchHistory/addHistory",
    async ({ email, movieId }) => {
        try {
            const response = await addUserWatchHistory(email, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const continueWatch = createAsyncThunk(
    "watchHistory/continueWatch",
    async ({ email, movieId }) => {
        try {
            const response = await continueWatching(email, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const updateHistory = createAsyncThunk(
    "watchHistory/updateHistory",
    async ({ email, movieId }) => {
        try {
            const response = await updateUserWatchHistory(email, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const checkMovieHistory = createAsyncThunk(
    "watchHistory/checkMovieHistory",
    async ({ email, movieId }) => {
        try {
            const response = await viewWatchHistoryDetail(email, movieId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const countView = createAsyncThunk(
    "watchHistory/countView",
    async ({ search }) => {
        try {
            const response = await countViewWatchHistory(search);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);