import { createSlice } from "@reduxjs/toolkit";
import { AddGenre, EditGenre, loadMovieGenres, removeGenre } from "../actions/movieGenreAction";
const initialValue = {
    movieGenre: [],
    isLoading: false,
    isError: false,
}

const movieGenreSlice = createSlice({
    name: "movieGenre",
    initialState: initialValue,
    reducers: {
        MovieGenreLoading: (state) => {
            state.isLoading = true;
        },
        MovieGenreSuccess: (state, action) => {
            state.isError = false;
            state.isLoading = false;
            state.movieGenre = action.payload.data;
        },
        MovieGenreFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
    },
    extraReducers: (builder) => {
            //loadMoviesGenre
            builder.addCase(loadMovieGenres.pending, (state) => {
                state.isLoading = true;
                state.isError = false;
            });
            builder.addCase(loadMovieGenres.fulfilled, (state, action) => {
                state.isLoading = false;
                state.isError = false;
                if (action.payload.data && action.payload.data.length > 0) {
                    state.movie = action.payload.data; 
                }
            });
            builder.addCase(loadMovieGenres.rejected, (state) => {
                state.isLoading = false;
                state.isError = true;
            });

            //AddGenre
            builder.addCase(AddGenre.pending, (state) => {
                state.isLoading = true;
                state.isError = false;
            });
            builder.addCase(AddGenre.fulfilled, (state) => {
                state.isLoading = false;
                state.isError = false;
            });
            builder.addCase(AddGenre.rejected, (state) => {
                state.isLoading = false;
                state.isError = true;
            });

            //EditGenre
            builder.addCase(EditGenre.pending, (state) => {
                state.isLoading = true;
                state.isError = false;
            });
            builder.addCase(EditGenre.fulfilled, (state) => {
                state.isLoading = false;
                state.isError = false;
            });
            builder.addCase(EditGenre.rejected, (state) => {
                state.isLoading = false;
                state.isError = true;
            });

            //removeGenre
            builder.addCase(removeGenre.pending, (state) => {
                state.isLoading = true;
                state.isError = false;
            });
            builder.addCase(removeGenre.fulfilled, (state) => {
                state.isLoading = false;
                state.isError = false;
            });
            builder.addCase(removeGenre.rejected, (state) => {
                state.isLoading = false;
                state.isError = true;
            });
        },
});

export const { MovieGenreLoading, MovieGenreSuccess, MovieGenreFail } = movieGenreSlice.actions;
export default movieGenreSlice.reducer;