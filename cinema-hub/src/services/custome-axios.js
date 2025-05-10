import axios from "axios";

const instance = axios.create({
    // baseURL: "https://localhost:7131/api/",
    baseURL: "https://localhost:7182/api/",
});

instance.interceptors.request.use(
  (config) => {
      // Lấy token từ localStorage hoặc nơi bạn lưu trữ
      const token = sessionStorage.getItem("token"); // Hoặc sessionStorage

      // Nếu có token, thêm nó vào headers
      if (token) {
        config.headers.Authorization = `Bearer ${token}`;
      }

      return config; // Trả về config đã sửa đổi
  },
  (error) => {
      // Xử lý lỗi khi config request
      return Promise.reject(error);
  }
);

axios.interceptors.request.use(function (config) {
    // Do something before request is sent
    return config;
  }, function (error) {
    // Do something with request error
    return Promise.reject(error);
  });
  
  // Add a response interceptor
  axios.interceptors.response.use(function (response) {
      // Any status code that lie within the range of 2xx cause this function to trigger
      // Do something with response data
      return response.data ? response.data : {statusCode: response.status, message: response.statusText};
    }, function (error) {
      // Any status codes that falls outside the range of 2xx cause this function to trigger
      // Do something with response error
      // let res = {};
      // // Do something with request error
      // if(error.response){
      //   res.data = error.response.data;
      //   res.status = error.response.status;
      //   res.headers = error.response.headers;
      // }else if(error.request){
      //   console.log(error.request);
      // }else{
      //   console.log('Error', error.message);
      // }
      // return res;
      return Promise.reject(error);
    });
  
  export default instance;
