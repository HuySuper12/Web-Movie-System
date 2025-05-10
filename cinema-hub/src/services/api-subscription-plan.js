import axios from './custome-axios';

const viewAllPlanPending = async () => {
    return await axios.get(`SubscriptionPlan/subscription-plan-pending`);
};

const viewAllSubscriptionAdmin = async (status) => {
    return await axios.get(`SubscriptionPlan/subscription-plans`,{
        params: {
            status: status
        }
    });
};

const viewAllSubscriptionPlan = async (status, email) => {
    return await axios.get(`SubscriptionPlan/accounts/${email}/subscription-plans`, {
        params: {
            status: status
        }
    });
};

const viewSubscriptionPlanDetail = async (id) => {
    return await axios.get(`SubscriptionPlan/${id}`);
};

const addSubscriptionPlan = async (data) => {
    return await axios.post(`SubscriptionPlan`, data);
};

const checkSubscriptionPlan = async (id, status) => {
    return await axios.put(`SubscriptionPlan/moderation/${id}`, {}, {
        params: {
            status: status
        }
    });
};

const updateSubscriptionPlan = async (data) => {
    return await axios.put(`SubscriptionPlan`, data);
};

const removeSubscriptionPlan = async (id) => {
    return await axios.delete(`SubscriptionPlan/${id}`);
};

export {viewAllPlanPending, viewAllSubscriptionAdmin, viewAllSubscriptionPlan, viewSubscriptionPlanDetail, addSubscriptionPlan, checkSubscriptionPlan, updateSubscriptionPlan, removeSubscriptionPlan };