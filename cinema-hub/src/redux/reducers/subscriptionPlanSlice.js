import { createSlice } from "@reduxjs/toolkit";
import { addSubscription, checkSubscription, removeSubscription, updateSubscription, viewAllPending, viewAllSubscription, viewAllSubscriptionStatus, viewSubscriptionDetail } from "../actions/subscriptionPlanAction";
import { createMoMoUrl, createPayPalUrl, createVNPAYUrl } from "../actions/transactionAction";

const initialValue = {
    subscriptionPlan: [],
    subscriptionPlanDetails: 0,
    isLoading: false,
    isError: false,
    isChange: false,
    subscriptionPlanSearchName: ({}),
};

const subscriptionPlanSlice = createSlice({
    name: "subscriptionPlan",
    initialState: initialValue,
    reducers: {
        subscriptionPlanLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        subscriptionPlanSuccess: (state, action ) => {
            state.isLoading = false;
            state.isLoading = false;
            state.subscriptionPlan = action.payload;
        },
        subscriptionPlanFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
        subscriptionDetail: (state, action) => {
            state.subscriptionPlanDetails = action.payload;
            state.isChange = !state.isChange;
        },
        subscriptionReset: (state) => {
            state.subscriptionPlan = [];
            state.isChange = !state.isChange;
        },
        subscriptionPlanSearch: (state, action) => {
            state.subscriptionPlanSearchName[action.payload.id] = action.payload.subscriptionPlanName;
        }
    },
    extraReducers: (builder) => {
        //viewAllPending
        builder.addCase(viewAllPending.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllPending.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.subscriptionPlan = action.payload.data; 
            }
        });
        builder.addCase(viewAllPending.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAllSubscriptionStatus
        builder.addCase(viewAllSubscriptionStatus.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllSubscriptionStatus.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.subscriptionPlan = action.payload.data; 
            }
        });
        builder.addCase(viewAllSubscriptionStatus.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAllSubscription
        builder.addCase(viewAllSubscription.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllSubscription.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.subscriptionPlan = action.payload.data; 
            }
        });
        builder.addCase(viewAllSubscription.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewSubscriptionDetail
        builder.addCase(viewSubscriptionDetail.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewSubscriptionDetail.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewSubscriptionDetail.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addSubscription
        builder.addCase(addSubscription.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addSubscription.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addSubscription.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //checkSubscription
        builder.addCase(checkSubscription.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(checkSubscription.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(checkSubscription.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //updateSubscription
        builder.addCase(updateSubscription.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(updateSubscription.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(updateSubscription.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //removeSubscription
        builder.addCase(removeSubscription.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(removeSubscription.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(removeSubscription.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //createVNPAYUrl
        builder.addCase(createVNPAYUrl.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(createVNPAYUrl.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
            state.subscriptionPlan = [];
        });
        builder.addCase(createVNPAYUrl.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //createMoMoUrl
        builder.addCase(createMoMoUrl.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(createMoMoUrl.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
            state.subscriptionPlan = [];
        });
        builder.addCase(createMoMoUrl.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //createPayPalUrl
        builder.addCase(createPayPalUrl.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(createPayPalUrl.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
            state.subscriptionPlan = [];
        });
        builder.addCase(createPayPalUrl.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { subscriptionPlanLoading, subscriptionPlanSuccess, subscriptionPlanFail, subscriptionDetail, subscriptionReset, subscriptionPlanSearch } = subscriptionPlanSlice.actions;
export default subscriptionPlanSlice.reducer;