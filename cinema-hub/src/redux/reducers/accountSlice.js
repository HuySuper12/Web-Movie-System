import { createSlice } from "@reduxjs/toolkit";
import { checkAccount, disableAccount, loadAccount, resetPasswordAccount, sendOTPAccount, updateAccountInfo, verifyOTPAccount, viewAccountsByRoleDetail, viewAccountsByRoless, viewProfileId } from "../actions/accountAction";

const initialValue = {
    account: [],
    isChange: false,
    isLoading: false,
    isError: false,
    lastAccount: 0,
    activeTab: "User",
    accountSearchName: ({}),
    violationCount: ({}),
}

const accountSlice = createSlice({
    name: "account",
    initialState: initialValue,
    reducers: {
        accountLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        accountSuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.account = action.payload.data;
        },
        accountFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
        accountChange: (state) => {
            state.isChange = !state.isChange;
            state.account = [];
            state.lastAccount = 0;
        },
        accountChangeActiveTab: (state, action) => {
            state.isChange = !state.isChange;
            state.account = [];
            state.lastAccount = 0;
            state.activeTab = action.payload.data;
        },
        accountSearchAccount: (state, action) => {
            state.accountSearchName[action.payload.id] = action.payload.fullName;
            state.violationCount[action.payload.id] = action.payload.violation;
        }
    }, 
    extraReducers: (builder) => {
        //loadAccount
        builder.addCase(loadAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(loadAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(loadAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //updateAccountInfo
        builder.addCase(updateAccountInfo.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(updateAccountInfo.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(updateAccountInfo.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //checkAccount
        builder.addCase(checkAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(checkAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(checkAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAccountsByRoless
        builder.addCase(viewAccountsByRoless.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAccountsByRoless.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewAccountsByRoless.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAccountsByRoleDetail
        builder.addCase(viewAccountsByRoleDetail.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAccountsByRoleDetail.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastAccount = action.payload.data[action.payload.data.length - 1].id;
                state.account = [...state.account, ...action.payload.data]; 
            }
        });
        builder.addCase(viewAccountsByRoleDetail.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewProfileId
        builder.addCase(viewProfileId.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewProfileId.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewProfileId.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //disableAccount
        builder.addCase(disableAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(disableAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(disableAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //sendOTPAccount
        builder.addCase(sendOTPAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(sendOTPAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(sendOTPAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //verifyOTPAccount
        builder.addCase(verifyOTPAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(verifyOTPAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(verifyOTPAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //resetPasswordAccount
        builder.addCase(resetPasswordAccount.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(resetPasswordAccount.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(resetPasswordAccount.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { accountLoading, accountSuccess, accountFail, accountChange, accountChangeActiveTab, accountSearchAccount } = accountSlice.actions;
export default accountSlice.reducer;