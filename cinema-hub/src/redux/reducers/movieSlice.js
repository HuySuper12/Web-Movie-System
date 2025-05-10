import { createSlice } from "@reduxjs/toolkit";
import { checkMovie, createMovie, deleteMovieInfo, getGenreNameWish, getMovieDetailById, getMovieLanguage, getMovieRelativeSuggestion, getMovieYear, loadMovies, loadPendingMovies, searchFilterMovie, searchTitle, updateMovieInfo, viewMovieTitle } from "../actions/movieAction";

const initialValue = {
    movie: [],
    year: [],
    language: [],
    filter: {
        language: "null",
        genreName: "null",
        year: 0
    },
    search: "",
    movieDetail: 0,
    isChange: false,
    isLoading: false,
    isError: false,
    lastMovieId: 0,
    activeTab: "true",
    movieTitle: [],
    movieSearchNames: ({}),
};

const movieSlice = createSlice({
    name:"movie",
    initialState: initialValue,
    reducers:{
        movieLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        movieSuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.movie = [...state.movie, ...action.payload.data]; 
        },
        movieFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
        movieReset: (state, action) => {
            state.movie = [];
            state.lastMovieId = 0;
            state.activeTab = action.payload;
        },
        movieChange: (state, action) => {
            state.filter = {
                language: action.payload.language,
                genreName: action.payload.genreName,
                year: action.payload.year
            };
            state.search = "";
            state.isChange = !state.isChange;
            state.movieFilter = [];
        },
        movieSearch: (state, action) => {
            state.filter = initialValue.filter;
            state.search = action.payload;
            state.isChange = !state.isChange;
            state.movieFilter = [];
        },
        movieDetail: (state, action) => {
            state.movieDetail = action.payload;
            state.filter = initialValue.filter;
            state.search = "";
        },
        movieYear: (state, action) => {
            state.year = action.payload;
        },
        movieLanguage: (state, action) => {
            state.language = action.payload;
        },
        movieSearchName: (state, action) => {
            state.movieSearchNames[action.payload.id] = action.payload.title;
        }
    }, extraReducers: (builder) => {
        //loadMovies
        builder.addCase(loadMovies.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadMovies.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastMovieId = action.payload.data[action.payload.data.length - 1].movieId;
                state.movie = [...state.movie, ...action.payload.data]; 
            }
        });
        builder.addCase(loadMovies.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //load pending movies
        builder.addCase(loadPendingMovies.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadPendingMovies.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastMovieId = action.payload.data[action.payload.data.length - 1].movieId;
                state.movie = [...state.movie, ...action.payload.data]; 
            }
        });
        builder.addCase(loadPendingMovies.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //searchFilterMovie
        builder.addCase(searchFilterMovie.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(searchFilterMovie.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(searchFilterMovie.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //searchTitle
        builder.addCase(searchTitle.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(searchTitle.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(searchTitle.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewMovieTitle
        builder.addCase(viewMovieTitle.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewMovieTitle.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.movieTitle = action.payload.data;
        });
        builder.addCase(viewMovieTitle.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //getMovieDetailById
        builder.addCase(getMovieDetailById.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getMovieDetailById.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.movieDetail = action.payload.data.movieId;
        });
        builder.addCase(getMovieDetailById.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //getMovieRelativeSuggestion
        builder.addCase(getMovieRelativeSuggestion.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getMovieRelativeSuggestion.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(getMovieRelativeSuggestion.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //getMovieYear
        builder.addCase(getMovieYear.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getMovieYear.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(getMovieYear.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //getMovieLanguage
        builder.addCase(getMovieLanguage.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getMovieLanguage.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(getMovieLanguage.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //getGenreNameWish
        builder.addCase(getGenreNameWish.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getGenreNameWish.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(getGenreNameWish.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //createMovie
        builder.addCase(createMovie.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(createMovie.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(createMovie.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //checkMovie
        builder.addCase(checkMovie.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(checkMovie.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(checkMovie.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //updateMovieInfo
        builder.addCase(updateMovieInfo.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(updateMovieInfo.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(updateMovieInfo.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //deleteMovieInfo
        builder.addCase(deleteMovieInfo.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(deleteMovieInfo.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(deleteMovieInfo.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { movieLoading, movieSuccess, movieReset, movieFail, movieChange, movieSearch, movieDetail, movieYear, movieLanguage, movieSearchName } = movieSlice.actions;
export default movieSlice.reducer;