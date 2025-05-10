import { createSlice } from "@reduxjs/toolkit";
import { addWishList, checkWishList, getMovieIdWishList, getMovieWishList, loadWishList, removeWishList } from "../actions/wishListAction";

const initialValue = {
    wishList: [],
    isLoading: false,
    isError: false,
    isChange: false,
    lastWishList: 0
};

const wishListSlice = createSlice({
    name: "wishList",
    initialState: initialValue,
    reducers: {
        wishListLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        wishListSuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.wishList = action.payload.data;
        },
        wishListFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
        wishListChange: (state) => {
            state.isChange = !state.isChange;
            state.wishList = [];
            state.lastWishList = 0;
        },
    },
    extraReducers: (builder) => {
        //loadWishList
        builder.addCase(loadWishList.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadWishList.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastWishList = action.payload.data[action.payload.data.length - 1].favoriteId;   
            }
        });
        builder.addCase(loadWishList.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
        
        //getMovieWishList
        builder.addCase(getMovieWishList.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getMovieWishList.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.wishList = [...state.wishList, ...action.payload.data]; 
            }
        });
        builder.addCase(getMovieWishList.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //getMovieIdWishList
        builder.addCase(getMovieIdWishList.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(getMovieIdWishList.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(getMovieIdWishList.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addWishList
        builder.addCase(addWishList.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addWishList.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
            state.wishList = [];
            state.lastWishList = 0;
        });
        builder.addCase(addWishList.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //removeWishList
        builder.addCase(removeWishList.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(removeWishList.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
            state.wishList = [];
            state.lastWishList = 0;
        });
        builder.addCase(removeWishList.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //checkWishList
        builder.addCase(checkWishList.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(checkWishList.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(checkWishList.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { wishListLoading, wishListSuccess, wishListFail, wishListChange} = wishListSlice.actions;
export default wishListSlice.reducer;