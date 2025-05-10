import axios from './custome-axios';

const viewProfileByEmail = async (email) => {
    return await axios.get(`Account/email/${email}`);
}

const viewAccountsByRole = async (role, pageSize, id) => {
    return await axios.get(`Account/roles`,{
        params: {
            role: role,
            pageSize: pageSize,
            userId: id
        }
    });   
}

const viewAccountsByRoles = async (role) => {
    return await axios.get(`Account/role`,{
        params: {
            role: role
        }
    });
}

const viewProfileById = async (id) => {
    return await axios.get(`Account/${id}`);
}

const updateAccount = async (data) => { 
    return await axios.put(`Account`, data);
}

const disableAccountUser = async (data) => {
    return await axios.delete(`Account/user/${data}`);
}

const removeAccountStaff = async (data) => {
    return await axios.delete(`Account/staff/${data}`);
}

//Send OTP
const sendOTP = async (email) => {
    return await axios.post(`Auth/otp/send`, {}, {
        params: {
            email: email
        }
    });
}

const verifyOTP = async (data) => {
    return await axios.post(`Auth/otp/verify`, data);
}

const resetPassword = async (data) => {
    return await axios.post(`Auth/password/reset`, data);
}

export { viewProfileByEmail, viewProfileById,viewAccountsByRole, updateAccount, disableAccountUser, removeAccountStaff,
    sendOTP, verifyOTP, resetPassword, viewAccountsByRoles
 };