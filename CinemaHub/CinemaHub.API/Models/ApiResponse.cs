namespace CinemaHub.API.Models
{
    public class ApiResponse<T>
    {
        public bool Success { get; set; } // Đánh dấu trạng thái thành công hay thất bại
        public int StatusCode { get; set; } // Mã trạng thái HTTP
        public string Message { get; set; } // Thông điệp lỗi hoặc thông báo
        public T Data { get; set; } // Dữ liệu trả về

        // Constructor mặc định
        public ApiResponse(bool success, T data, string message = "", int statusCode = 200)
        {
            Success = success;
            Data = data;
            Message = message;
            StatusCode = statusCode;
        }

        public static ApiResponse<T> SuccessResponse(T data)
        {
            return new ApiResponse<T>(true, data, "", 200);
        }

        public static ApiResponse<T> ErrorResponse(string message, int statusCode)
        {
            return new ApiResponse<T>(false, default, message, statusCode);
        }
    }
}
