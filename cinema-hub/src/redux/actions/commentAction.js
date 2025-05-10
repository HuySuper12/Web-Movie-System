import { createAsyncThunk } from "@reduxjs/toolkit";
import { addComment, removeComment, viewAllComment, viewAllCommentByMovieId } from "../../services/api-comment";
import { commentChange } from "../reducers/commentSlice";


export const viewAllComments = createAsyncThunk(
    'comments/viewAllComments',
    async ({ pageSize, commentId }) => {
        try{
            const response = await viewAllComment(pageSize, commentId);
            return response.data;
        } catch {
            return { error: true };
        }    
    }
);

export const viewAllCommentsByMovieId = createAsyncThunk(
    'comments/viewAllCommentsByMovieId',
    async ({ movieId, status, pageSize, commentId }) => {
        try{
            const response = await viewAllCommentByMovieId(movieId, status, pageSize, commentId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const addNewComment = createAsyncThunk(
    'comments/addNewComment',
    async (data, { dispatch }) => {
        try{
            const response = await addComment(data);
            dispatch(commentChange());
            return response.data;
        }catch {
            return { error: true };
        }    
    }
);

export const deleteComment = createAsyncThunk(
    'comments/deleteComment',
    async ({commentId, dispatch }) => {
        try{
            const response = await removeComment(commentId);
            dispatch(commentChange());
            return response.data;
        } catch {
            return { error: true };
        }
    }
);