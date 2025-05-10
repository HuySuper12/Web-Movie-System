import { combineReducers, configureStore } from "@reduxjs/toolkit";
import authenSlice from "./reducers/authenSlice";
import movieSlice from "./reducers/movieSlice";
import movieGenreSlice from "./reducers/movieGenreSlice";
import wishListSlice from "./reducers/wishListSlice";
import watchHistorySlice from "./reducers/watchHistorySlice";
import notificationSlice from "./reducers/notificationSlice";
import commentSlice from "./reducers/commentSlice";
import ratingSlice from "./reducers/ratingSlice";
import subscriptionPlanSlice from "./reducers/subscriptionPlanSlice";
import paymentSlice from "./reducers/paymentSlice";
import accountSlice from "./reducers/accountSlice";

//Gop cac root vao 1 reducer
const appReducer = combineReducers({
        account: accountSlice,
        authen: authenSlice,
        movie: movieSlice,
        movieGenre: movieGenreSlice,
        wishList: wishListSlice,
        watchHistory: watchHistorySlice,
        notification: notificationSlice,
        comment: commentSlice,
        rating: ratingSlice,
        subscriptionPlan: subscriptionPlanSlice,
        payment: paymentSlice
})

// Tạo rootReducer để reset toàn bộ state khi cần
const rootReducer = (state, action) => {
    if (action.type === 'RESET_STATE') {
        return appReducer(undefined, action); // Reset toàn bộ state
    }
    return appReducer(state, action);
};

// Cấu hình store
const store = configureStore({
    reducer: rootReducer
});

export default store;