import { createAsyncThunk } from "@reduxjs/toolkit";
import { checkFreeTrial, getStatisticSystem, getTotalRevenue, viewAllPayment, viewAllPaymentMethod, viewPaymentDetail, viewPaymentListEmail, viewPaymentRemainingDuration } from "../../services/api-payment";

export const viewAllPayments = createAsyncThunk(
    'payment/viewAllPayments',
    async ({ pageSize, paymentId }) => {
        try {
            const response = await viewAllPayment(pageSize, paymentId);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewAllPaymentMethods = createAsyncThunk(
    'payment/viewAllPaymentMethods',
    async ({ paymentMethod }) => {
        try {
            const response = await viewAllPaymentMethod(paymentMethod);
            return response.data;
        } catch {
            return { error: true };
        }  
    }
);

export const viewPaymentById = createAsyncThunk(

    'payment/viewPaymentById',
    async ({ id }) => {
        try {
            const response = await viewPaymentDetail(id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewPaymentListByEmail = createAsyncThunk(
    'payment/viewPaymentListByEmail',
    async ({ email, pageSize, paymentId }) => {
        try {
            const response = await viewPaymentListEmail(email, pageSize, paymentId);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const viewPaymentRemaining = createAsyncThunk(
    'payment/viewPaymentRemaining',
    async ({ email }) => {
        try {
            const response = await viewPaymentRemainingDuration(email);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const paymentFreeTrial = createAsyncThunk(
    'payment/paymentFreeTrial',
    async ({ email }) => {
        try {
            const response = await checkFreeTrial(email);
            return response.data.data;
        } catch {
            return { error: true };
        } 
    }
);

export const systemStatistic = createAsyncThunk(
    'payment/systemStatistic',
    async () => {
        try {
            const response = await getStatisticSystem();
            return response.data.data;
        } catch {
            return { error: true };
        }
    }
);

export const totalRevenue = createAsyncThunk(
    'payment/totalRevenue',
    async () => {
        try {
            const response = await getTotalRevenue();
            return response.data.data;
        } catch {
            return { error: true };
        }
    }
);