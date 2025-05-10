import { createSlice } from "@reduxjs/toolkit";
import { addNewComment, deleteComment, viewAllComments, viewAllCommentsByMovieId } from "../actions/commentAction";

const initialValue = {
    comment: [],
    isChange: false,
    isLoading: false,
    isError: false,
    lastCommentId: 0,
};

const commentSlice = createSlice({
    name: "comment",
    initialState: initialValue,
    reducers: {
        commentLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        commentSuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.comment = action.payload.data;
        },
        commentFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
        commentChange: (state) => {
            state.isChange = !state.isChange;
            state.comment = [];
            state.lastCommentId = 0;
        },
    },
    extraReducers: (builder) => {
        //viewAllComments
        builder.addCase(viewAllComments.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllComments.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastCommentId = action.payload.data[action.payload.data.length - 1].commentId;
                state.comment = [...state.comment, ...action.payload.data]; 
            }
        });
        builder.addCase(viewAllComments.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAllCommentsByMovieId
        builder.addCase(viewAllCommentsByMovieId.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllCommentsByMovieId.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewAllCommentsByMovieId.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addNewComment
        builder.addCase(addNewComment.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addNewComment.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addNewComment.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //deleteComment
        builder.addCase(deleteComment.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(deleteComment.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(deleteComment.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    },
});

export const { commentLoading, commentSuccess, commentFail, commentChange } = commentSlice.actions;
export default commentSlice.reducer;

