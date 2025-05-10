import { createAsyncThunk } from "@reduxjs/toolkit";
import { addNotification, addNotificationViolationFirst, addNotificationViolationSecond, countNotificationUnread, updateNotification, viewAllUserNotifications, viewStaffNotificationSending, viewUserNotificationById, viewUserNotifications, viewUserNotificationUnread } from "../../services/api-notification";
import {  notificationId } from "../reducers/notificationSlice";

export const viewNotificationUnRead = createAsyncThunk(
    "notification/viewNotificationUnRead",
    async ({ email, pageSize, id }) => {
        try {
            const response = await viewUserNotificationUnread(email, pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewStaffNotification = createAsyncThunk(
    "notification/viewStaffNotification",
    async ({ email, pageSize, id }) => {
        try {
            const response = await viewStaffNotificationSending(email, pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const viewUserNotification = createAsyncThunk(
    "notification/viewUserNotification",
    async ({ email, pageSize, id }) => {
        try {
            const response = await viewUserNotifications(email, pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const countNotiUnRead = createAsyncThunk(
    "notification/countNotiUnRead",
    async (email) => {
        try {
            const response = await countNotificationUnread(email);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewNotificationDetail = async (dispatch, id) => {
    dispatch(notificationId(id));
};

export const viewNotificationById = createAsyncThunk(
    "notification/viewNotificationById",
    async (id) => {
        try {
            const response = await viewUserNotificationById(id);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const updateNotificationUser = createAsyncThunk(
    "notification/updateNotificationUser",
    async (id) => {
        try {
            const response = await updateNotification(id);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const addNotificationUser = createAsyncThunk(
    "notification/addNotificationUser",
    async (data) => {
        try {
            const response = await addNotification(data);
            return response.data;
        } catch {
            return { error: true };
        }   
    }
);

export const viewAllUserNotification = createAsyncThunk(
    "notification/viewAllUserNotification",
    async ({ pageSize, id }) => {
        try {
            const response = await viewAllUserNotifications(pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }     
    }
);

export const addViolationFirst = createAsyncThunk(
    "notification/addViolationFirst",
    async ({ staffEmail, userId, commentId }) => {
        try {
            const response = await addNotificationViolationFirst(staffEmail, userId, commentId);
            return response.data;
        } catch {
            return { error: true };
        }    
    }
);

export const addViolationSecond = createAsyncThunk(
    "notification/addViolationSecond",
    async ({ staffEmail, userId, commentId }) => {
        try {
            const response = await addNotificationViolationSecond(staffEmail, userId, commentId);
        return response.data;
        } catch {
            return { error: true };
        }  
    }
);

