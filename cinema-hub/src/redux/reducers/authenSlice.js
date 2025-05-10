import { createSlice } from "@reduxjs/toolkit";
import { loginAccount, loginGoogleAccount, logoutAccount, refreshTokens, registerAccount, registerAccountStaff } from "../actions/authenAction";

const initialValue = {
    account: {
        email: "",
        token: "",
        role: "",
        exp: 0,
        auth: false,
    },
    isChange: false,
    isLoading: false,
    isError: false,
}

const authenSlice = createSlice({
    name: "authen",
    initialState: initialValue,
    reducers:{
        loginRequest: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        loginSuccess: (state, action) => {
            state.account = {
                email: action.payload.email,
                token: action.payload.token,
                role: action.payload.role,
                auth: true,
            }
            state.isLoading = false;
            state.isError = false;
        },
        loginFailed: (state) => {
            state.isError = true;
            state.isLoading = false;
        },
        logout: (state) =>{
            state.account = initialValue.account;
        },
        refresh: (state) => {
            state.account = {
                email: sessionStorage.getItem("email"),
                token: sessionStorage.getItem("token"),
                role: sessionStorage.getItem("role"),
                exp: sessionStorage.getItem("exp"),
                auth: true
            }
            state.isLoading = false;
            state.isError = false;
        },
        changeInfo: (state) => {
            state.isChange = !state.isChange;
        }
    }, 
    extraReducers: (builder) => {
        //loginAccount
        builder.addCase(loginAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loginAccount.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if(action.payload.success == true){
                state.account = {
                    email: action.payload.email,
                    token: action.payload.token,
                    role: action.payload.role,
                    exp: action.payload.exp,
                    auth: action.payload.auth,
                }
            }        
        });
        builder.addCase(loginAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //refreshToken
        builder.addCase(refreshTokens.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(refreshTokens.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if(action.payload.success == true){
                state.account = {
                    email: action.payload.email,
                    token: action.payload.token,
                    role: action.payload.role,
                    exp: action.payload.exp,
                    auth: action.payload.auth,
                }
            }  
        });
        builder.addCase(refreshTokens.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //loginGoogleAccount
        builder.addCase(loginGoogleAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loginGoogleAccount.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if(action.payload.success == true){
                state.account = {
                    email: action.payload.email,
                    token: action.payload.token,
                    role: action.payload.role,
                    exp: action.payload.exp,
                    auth: action.payload.auth,
                }
            }  
        });
        builder.addCase(loginGoogleAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //registerAccount
        builder.addCase(registerAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(registerAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(registerAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //registerAccountStaff
        builder.addCase(registerAccountStaff.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(registerAccountStaff.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(registerAccountStaff.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //logoutAccount
        builder.addCase(logoutAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(logoutAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
            state.account = initialValue.account;
        });
        builder.addCase(logoutAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { loginRequest, loginSuccess, loginFailed, logout, refresh, changeInfo } = authenSlice.actions;
export default authenSlice.reducer;