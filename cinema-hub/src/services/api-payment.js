import axios from './custome-axios'

const viewAllPayment = async (pageSize, paymentId) => {
    return await axios.get(`Payment/payments`, {
        params: {
            pageSize: pageSize,
            paymentId: paymentId
        }
    });
};

const viewAllPaymentMethod = async (paymentMethod) => {
    return await axios.get(`Payment/payments/by-method`, {
        params: {
            paymentMethod: paymentMethod
        }
    });
};

const viewPaymentDetail = async (id) => {
    return await axios.get(`Payment/${id}`);
};

const viewPaymentListEmail = async (email, pageSize, paymentId) => {
    return await axios.get(`Payment/accounts/${email}/payments`, {
        params: {
            pageSize: pageSize,
            paymentId: paymentId
        }
    });
};

const viewPaymentRemainingDuration = async (email) => {
    return await axios.get(`Payment/accounts/${email}/remaining-duration`);
};

const checkFreeTrial = async (email) => {
    return await axios.get(`Payment/accounts/${email}/free-trial`);
};

const getStatisticSystem = () => {
    return  axios.get(`Payment/payments/statistic-system`);
};

const getTotalRevenue = () => {
    return axios.get(`Payment/payments/total-revenue`);
};

export {viewAllPayment, viewAllPaymentMethod, viewPaymentDetail, viewPaymentListEmail, viewPaymentRemainingDuration, checkFreeTrial, getStatisticSystem, getTotalRevenue};