import { createSlice } from "@reduxjs/toolkit";
import { addHistory, checkMovieHistory, continueWatch, countView, loadMovieInHistory, loadWatchHistory, loadWatchHistoryDetail, updateHistory } from "../actions/watchHistoryAction";

const initialValue = {
    watchHistory: [],
    movieInHistory: [],
    isChange: false,
    isLoading: false,
    isError: false,
    lastHistory: 0,
}

const watchHistorySlice = createSlice({
    name: "watchHistory",
    initialState: initialValue,
    reducers: {
        watchHistoryLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        watchHistorySuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.watchHistory = action.payload.data;
        },
        movieWatchHistorySuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.movieInHistory = action.payload.data;
        },
        watchHistoryFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        }
    },
    extraReducers: (builder) => {
        //loadWatchHistory
        builder.addCase(loadWatchHistory.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadWatchHistory.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastHistory = action.payload.data[action.payload.data.length - 1].historyId;
                state.watchHistory = [...state.watchHistory, ...action.payload.data]; 
            }
        });
        builder.addCase(loadWatchHistory.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //loadMovieInHistory
        builder.addCase(loadMovieInHistory.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadMovieInHistory.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.movieInHistory = [...state.movieInHistory, ...action.payload.data]; 
            }
        });
        builder.addCase(loadMovieInHistory.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //loadWatchHistoryDetail
        builder.addCase(loadWatchHistoryDetail.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadWatchHistoryDetail.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(loadWatchHistoryDetail.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //countView
        builder.addCase(countView.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(countView.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(countView.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //checkMovieHistory
        builder.addCase(checkMovieHistory.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(checkMovieHistory.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(checkMovieHistory.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addHistory
        builder.addCase(addHistory.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addHistory.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addHistory.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //continueWatch
        builder.addCase(continueWatch.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(continueWatch.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(continueWatch.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //updateHistory
        builder.addCase(updateHistory.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(updateHistory.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(updateHistory.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { watchHistoryLoading, watchHistorySuccess, movieWatchHistorySuccess, watchHistoryFail } = watchHistorySlice.actions;
export default watchHistorySlice.reducer;