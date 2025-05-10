import { createAsyncThunk } from "@reduxjs/toolkit";
import { addSubscriptionPlan, checkSubscriptionPlan, removeSubscriptionPlan, updateSubscriptionPlan, viewAllPlanPending, viewAllSubscriptionAdmin, viewAllSubscriptionPlan, viewSubscriptionPlanDetail } from "../../services/api-subscription-plan";
import { subscriptionDetail, subscriptionPlanSearch } from "../reducers/subscriptionPlanSlice";

export const viewAllPending = createAsyncThunk(
    'subscriptionPlan/viewAllPending',
    async () => {
        try {
            const response = await viewAllPlanPending();
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const viewAllSubscriptionStatus = createAsyncThunk(
    'subscriptionPlan/viewAllSubscriptionStatus',
    async ({ status }) => {
        try {
            const response = await viewAllSubscriptionAdmin(status);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const viewAllSubscription = createAsyncThunk(
    'subscriptionPlan/viewAllSubscription',
    async ({ status, email }) => {
        try {
            const response = await viewAllSubscriptionPlan(status, email);
            return response.data;
        } catch {
            return { error: true };
        }   
    }
);

export const viewSubscriptionDetail = createAsyncThunk(
    'subscriptionPlan/viewSubscriptionDetail',
    async ({ id }) => { 
        try {
            const response = await viewSubscriptionPlanDetail(id);
            return response.data;
        } catch {
            return { error: true };
        }     
    }
);

export const addSubscription = createAsyncThunk(
    'subscriptionPlan/addSubscription',
    async (data) => {
        try {
            const response = await addSubscriptionPlan(data);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const checkSubscription = createAsyncThunk(
    'subscriptionPlan/checkSubscription',
    async ({ id, status }) => {
        try {
            const response = await checkSubscriptionPlan(id, status);
            return response.data;
        } catch {
            return { error: true };
        } 
    }
);

export const updateSubscription = createAsyncThunk(
    'subscriptionPlan/updateSubscription',
    async (data) => {
        try {
            const response = await updateSubscriptionPlan(data);
            return response.data;
        } catch {
            return { error: true };
        }
        
    }
);

export const removeSubscription = createAsyncThunk(
    'subscriptionPlan/removeSubscription',
    async ({ id }) => {
        try {
            const response = await removeSubscriptionPlan(id);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

export const choosePayment = async (dispatch, data) => {
    dispatch(subscriptionDetail(data));
}

export const subscriptionPlanSearchName = (dispatch, data) => {
    dispatch(subscriptionPlanSearch(data));
}
