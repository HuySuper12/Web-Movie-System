
import { createAsyncThunk } from "@reduxjs/toolkit";
import { paymentMoMoUrl, paymentPayPalUrl, paymentVNPAYUrl } from "../../services/api-transaction";

//Tao url thanh toan VNPAY
export const createVNPAYUrl = createAsyncThunk(
    'subscriptionPlan/createVNPAYUrl',
    async (data) => {
        try {
            console.log(data);
            const response = await paymentVNPAYUrl(data);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

//Tao url thanh toan MoMo
// export const createMoMoUrl = async (data) => {
//     try{
//         const response = await paymentMoMoUrl(data);
//         return response.data;
//     }catch{
//         return { error: true };
//     }
// };
export const createMoMoUrl = createAsyncThunk(
    'subscriptionPlan/createMoMoUrl',
    async (data) => {
        try {
            const response = await paymentMoMoUrl(data);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

//Tao url thanh toan PayPal
export const createPayPalUrl = createAsyncThunk(
    'subscriptionPlan/createPayPalUrl',
    async (data) => {
        try {
            const response = await paymentPayPalUrl(data);
            return response.data;
        } catch {
            return { error: true };
        }
    }
);

