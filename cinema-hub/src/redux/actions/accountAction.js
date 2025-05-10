import {  disableAccountUser, resetPassword, sendOTP, updateAccount, verifyOTP, viewAccountsByRole, viewAccountsByRoles, viewProfileByEmail, viewProfileById } from "../../services/api-acccount";
import { createAsyncThunk } from "@reduxjs/toolkit";
import { accountSearchAccount } from "../reducers/accountSlice";

export const loadAccount = createAsyncThunk(
    "account/loadAccount",
    async ({ email }) => {
        try {
            const response = await viewProfileByEmail(email);
            return response.data;
        } catch {
            return { error: true };
        }   
    }
);

export const updateAccountInfo = createAsyncThunk(
    "account/updateAccountInfo",
    async (data) => {
        try {
            const response = await updateAccount(data);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const checkAccount = createAsyncThunk(
    "account/checkAccount",
    async (data) => {
        try {
            const response = await viewProfileByEmail(data);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewAccountsByRoless = createAsyncThunk(
    "account/viewAccountsByRoless",
    async ({ role }) => {
        try {
            const response = await viewAccountsByRoles(role);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewAccountsByRoleDetail = createAsyncThunk(
    "account/viewAccountsByRoleDetail",
    async ({ data, pageSize, id }) => {
        try {
            const response = await viewAccountsByRole(data, pageSize, id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewProfileId = createAsyncThunk(
    "account/viewProfileId",
    async (id) => {
        try {
            const response = await viewProfileById(id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const disableAccount = createAsyncThunk(
    "account/disableAccount",
    async ({ email }) => {
        try {
            const response = await disableAccountUser(email);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const sendOTPAccount = createAsyncThunk(
    "account/sendOTPAccount",
    async (email) => {
        try {
            const response = await sendOTP(email);
            localStorage.setItem("email", email);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const verifyOTPAccount = createAsyncThunk(
    "account/verifyOTPAccount",
    async ({ email, otp }) => {
        try {
            const data = {
                email: email,
                otp: otp,
            }
            const response = await verifyOTP(data);
            localStorage.setItem("otp", otp);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const resetPasswordAccount = createAsyncThunk(
    "account/resetPasswordAccount", 
    async ({ email, newPassword }) => {
        try {
            const data = {
                email: email,
                password: newPassword,
            }
            const response = await resetPassword(data);
            localStorage.removeItem("otp");
            localStorage.removeItem("email");
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const handleSearchAccount = async (dispatch, data) => {
    dispatch(accountSearchAccount(data));
}


