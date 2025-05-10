import { jwtDecode } from 'jwt-decode';
import axios from './custome-axios';

const decodeJWT = (token) => {
    try {
      const decoded = jwtDecode(token);
      return decoded;
    } catch (error) {
      console.error("Invalid token:", error.message);
      return null;
    }
  };

const login = async (data) => {
    return await axios.post(`Auth/sign-in`, data, {
        withCredentials: true,  // Đảm bảo cookie được gửi cùng với yêu cầu
    });
};

const loginGoogle = async (data) => {
    return await axios.post(`Auth/sign-in/google/${data}`, {}, {
        withCredentials: true,  // Đảm bảo cookie được gửi cùng với yêu cầu
    });
};

const register = async (data) => {
    return await axios.post(`Auth/sign-up/user`, data);
}

const registerStaff = async (data) => {
    return await axios.post(`Auth/sign-up/staff`, data);
}

const logout = async (email) => {
    return await axios.post(`Auth/sign-out/${email}`, {} ,{
        withCredentials: true
      });
};

const refreshToken = async (email) => {
    return await axios.post(`Auth/renew-access-token/${email}`, {}, {
        withCredentials: true,  // Đảm bảo cookie được gửi cùng với yêu cầu
    });
};

export { decodeJWT, login, loginGoogle, register, registerStaff, logout, refreshToken };