import axios from './custome-axios';

const viewUserNotifications = async (email, pageSize, id) => {
    return await axios.get(`/Notification/accounts/${email}/notifications/user`, {
        params: {
            pageSize: pageSize,
            notificationId: id
        }
    });
};

const viewUserNotificationUnread = async (email, pageSize, id) => {
    return await axios.get(`Notification/accounts/${email}/notifications/unread`, {
        params: {
            pageSize: pageSize,
            notificationId: id
        }
    });
};

const viewAllUserNotifications = async (pageSize, id) => {
    return await axios.get(`/Notification/notifications`, {
        params: {
            pageSize: pageSize,
            notificationId: id
        }
    });
};

const countNotificationUnread = async (email) => {
    return await axios.get(`Notification/accounts/${email}/notifications/unread/count`);
};

const viewUserNotificationById = async (notificationId) => {
    return await axios.get(`Notification/${notificationId}`);
};

const addNotification = async (data) => {
    return await axios.post(`Notification`, data);
};

const updateNotification = async (notificationId) => {
    return await axios.put(`Notification/${notificationId}`);
};

const removeNotification = async (notificationId) => {
    return await axios.delete(`Notification/${notificationId}`);
};

const viewStaffNotificationSending = async (email, pageSize, id) => {
    return await axios.get(`Notification/accounts/${email}/notifications/staff-sending`, {
        params: {
            pageSize: pageSize,
            notificationId: id
        }
    });
};

const addNotificationViolationFirst = async (staffEmail, userId, commentId) => {
    return await axios.post(`Notification/accounts/staff/${staffEmail}/user/${userId}/comments/${commentId}/violation/first`);
};

const addNotificationViolationSecond = async (staffEmail, userId, commentId) => {
    return await axios.post(`Notification/accounts/staff/${staffEmail}/user/${userId}/comments/${commentId}/violation/second`);
};

export { viewUserNotifications, viewUserNotificationUnread, viewAllUserNotifications, countNotificationUnread, viewUserNotificationById, addNotification, updateNotification, removeNotification, viewStaffNotificationSending, addNotificationViolationFirst, addNotificationViolationSecond };