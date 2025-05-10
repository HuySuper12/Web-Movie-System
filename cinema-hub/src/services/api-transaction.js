import axios from './custome-axios'

//VNPAY
const paymentVNPAYUrl = async (data) => {
    return await axios.post(`VNPay/link`, data);
};

//MoMo
const paymentMoMoUrl = async (data) => {
    return await axios.post(`MoMo/link`, data);
};

//PayPal
const paymentPayPalUrl = async (data) => {
    return await axios.post(`PayPal/link`, data);
};

export {paymentVNPAYUrl, paymentMoMoUrl, paymentPayPalUrl};