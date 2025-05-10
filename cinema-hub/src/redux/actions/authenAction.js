import { loginRequest, loginSuccess } from "../reducers/authenSlice";
import { decodeJWT, login, loginGoogle, logout, register, registerStaff } from "../../services/api-auth";
import { createAsyncThunk } from "@reduxjs/toolkit";
import { refreshToken } from "../../services/api-auth";
import Cookies from 'js-cookie';

export const loginAccount = createAsyncThunk(
    "authen/loginAccount",
    async (account, { dispatch }) => {
        try {
            dispatch({ type: "RESET_STATE" }); // Reset toàn bộ Redux state
            const response = await login(account);
            const decode = decodeJWT(response.data.data.accessToken);
            const payload = {
                email: account.email,
                token: response.data.data.accessToken,
                role: decode["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"],
                exp: decode["exp"],
                auth: true,
            };
            sessionStorage.setItem("email", account.email);
            sessionStorage.setItem("token", response.data.data.accessToken);
            sessionStorage.setItem("role", decode["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"]);
            sessionStorage.setItem("exp", decode["exp"]);
            return payload;
        } catch (error) {
           return { error: error.response.data }
        }
    }
);

export const refreshTokens = createAsyncThunk(
    "authen/refreshTokens",
    async ({ email }) => {
        try {
            const response = await refreshToken(email);
            const decode = decodeJWT(response.data.data);
            const payload = {
                email: sessionStorage.getItem("email"),
                token: response.data.data,
                role: decode["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"],
                exp: decode["exp"],
                auth: true,
            };
            sessionStorage.setItem("token", response.data.data);
            sessionStorage.setItem("exp", decode["exp"]);
            return payload;
        } catch {
            return { error: true }; 
        }
    }
);

export const loginGoogleAccount = createAsyncThunk(
    "authen/loginGoogleAccount",
    async (token, { dispatch }) => {
        try {
            dispatch({ type: "RESET_STATE" }); // Reset toàn bộ Redux state
            const response = await loginGoogle(token);
            const decode = decodeJWT(response.data.data.accessToken);
            const payload = {
                email: decode["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"],
                token: response.data.data.accessToken,
                role: decode["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"],
                exp: decode["exp"],
                auth: true,
            };
            sessionStorage.setItem("email", decode["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress"]);
            sessionStorage.setItem("token", response.data.data.accessToken);
            sessionStorage.setItem("role", decode["http://schemas.microsoft.com/ws/2008/06/identity/claims/role"]);
            sessionStorage.setItem("exp", decode["exp"]);
            return payload;
        } catch (error) {
            return { error: error.response.data }; // Trả về lỗi khi xảy ra BadRequest (Lay thong tin phan luong) hoac co the return true false
        }
    }
);

export const logoutAccount = createAsyncThunk(
    "authen/logoutAccount",
    async ({ email }) => {
        try {
            sessionStorage.removeItem("email");
            sessionStorage.removeItem("token");
            sessionStorage.removeItem("role");
            sessionStorage.removeItem("exp");
            await logout(email);
            Cookies.remove("refreshToken");
        } catch (error) {
            return { error: error.response.data };
        }
    }
);

export const registerAccount = createAsyncThunk(
    "authen/registerAccount",
    async (data) => {
        try {
            const response = await register(data);
            return response;
        } catch (error) {
            return { error: error.response.data };
        }
    }
);

export const registerAccountStaff = createAsyncThunk(
    "authen/registerAccountStaff",
    async (data) => {
        try {
            const response = await registerStaff(data);
            return response;
        } catch (error) {
            return { error: error.response.data };
        }
    }
);

export const refreshAccount = (dispatch) => {
    const email = sessionStorage.getItem("email");
    const token = sessionStorage.getItem("token");
    const role = sessionStorage.getItem("role");
    if(email === null || token === null || role === null){
        return;
    }
    dispatch(loginRequest());
    const payload = {
        email: email,
        token: token,
        role: role,
    }
    dispatch(loginSuccess(payload));
}