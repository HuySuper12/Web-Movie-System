import { createSlice } from "@reduxjs/toolkit";
import { addNewRating, calulateMovieRating, deleteRating, viewAllRatingsByMovieId, viewRatingStatisticAdmin } from "../actions/ratingAction";

const initialValue = {
    rating: [],
    isChange: false,
    isLoading: false,
    isError: false,
    lastRatingId: 0
}

const ratingSlice = createSlice({
    name: "rating",
    initialState: initialValue,
    reducers: {
        ratingLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        ratingSuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.rating = action.payload;
        },
        ratingFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        }
    },
    extraReducers: (builder) => {
        //viewAllRatingsByMovieId
        builder.addCase(viewAllRatingsByMovieId.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllRatingsByMovieId.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewAllRatingsByMovieId.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewRatingStatisticAdmin
        builder.addCase(viewRatingStatisticAdmin.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewRatingStatisticAdmin.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastRatingId = action.payload.data[action.payload.data.length - 1].id;
                state.rating = [...state.rating, ...action.payload.data]; 
            }
        });
        builder.addCase(viewRatingStatisticAdmin.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //calulateMovieRating
        builder.addCase(calulateMovieRating.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(calulateMovieRating.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(calulateMovieRating.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addNewRating
        builder.addCase(addNewRating.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addNewRating.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addNewRating.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //deleteRating
        builder.addCase(deleteRating.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(deleteRating.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(deleteRating.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { ratingLoading, ratingSuccess, ratingFail } = ratingSlice.actions;
export default ratingSlice.reducer;