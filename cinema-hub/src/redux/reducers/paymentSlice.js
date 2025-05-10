import { createSlice } from "@reduxjs/toolkit";
import { paymentFreeTrial, systemStatistic, totalRevenue, viewAllPaymentMethods, viewAllPayments, viewPaymentListByEmail, viewPaymentRemaining } from "../actions/paymentAction";

const initialValue = {
    payment: [],
    paymentDetails: 0,
    isLoading: false,
    isError: false,
    isChange: false,
    lastPaymentId: 0,
};

const paymentSlice = createSlice({
    name: "payment",
    initialState: initialValue,
    reducers: {
        paymentLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        paymentSuccess: (state, action ) => {
            state.isLoading = false;
            state.isLoading = false;
            state.payment = action.payload;
        },
        paymentFail: (state) => {
            state.isLoading = false;
            state.isError = true;
        },
        paymentDetail: (state, action) => {
            state.paymentDetails = action.payload;
            state.isChange = !state.isChange;
        }
    },
    extraReducers: (builder) => {
        //viewAllPayments
        builder.addCase(viewAllPayments.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllPayments.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastPaymentId = action.payload.data[action.payload.data.length - 1].paymentId;
                state.payment = [...state.payment, ...action.payload.data]; 
            }
        });
        builder.addCase(viewAllPayments.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAllPaymentMethods
        builder.addCase(viewAllPaymentMethods.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllPaymentMethods.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastPaymentId = action.payload.data[action.payload.data.length - 1].paymentId;
                state.payment = [...state.payment, ...action.payload.data]; 
            }
        });
        builder.addCase(viewAllPaymentMethods.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewPaymentListByEmail
        builder.addCase(viewPaymentListByEmail.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewPaymentListByEmail.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastPaymentId = action.payload.data[action.payload.data.length - 1].paymentId;
                state.payment = [...state.payment, ...action.payload.data]; 
            }
        });
        builder.addCase(viewPaymentListByEmail.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewPaymentRemaining
        builder.addCase(viewPaymentRemaining.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewPaymentRemaining.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewPaymentRemaining.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //paymentFreeTrial
        builder.addCase(paymentFreeTrial.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(paymentFreeTrial.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(paymentFreeTrial.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //systemStatistic
        builder.addCase(systemStatistic.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(systemStatistic.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(systemStatistic.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //totalRevenue
        builder.addCase(totalRevenue.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(totalRevenue.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(totalRevenue.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    }
});

export const { paymentLoading, paymentSuccess, paymentFail, paymentDetail } = paymentSlice.actions;
export default paymentSlice.reducer;