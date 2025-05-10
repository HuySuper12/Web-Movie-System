import { Button, Card, Flex, Typography } from "antd";
import { Line } from "react-chartjs-2";
import {
  Chart as ChartJS,
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement,
  Tooltip,
  Legend,
} from "chart.js";
import { systemStatistic } from "../../redux/actions/paymentAction";
import { useDispatch } from "react-redux";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

ChartJS.register(
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement,
  Tooltip,
  Legend
);

function Banner() {
  // Dữ liệu mẫu
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [chartDataTotalView, setChartDataTotalView] = useState(null); // Dữ liệu cho biểu đồ
  const [chartDataRevenue, setChartDataRevenue] = useState(null); // Dữ liệu cho biểu đồ

  const loadStatistic = async () => {
    try {
      const response = await dispatch(systemStatistic());
      // Kiểm tra dữ liệu trả về
      if (!Array.isArray(response.payload) || response.payload.error === true) {
        console.error("Dữ liệu từ API không hợp lệ:", response.payload);
        return;
      }

      // Chuyển đổi `name` thành định dạng dễ đọc
      const labels = response.payload.map((item) => {
        const [year, month] = item.name.split("-");
        return `${month.padStart(2, "0")}/${year}`; // Định dạng: "MM/YYYY"
      });

      const totalView = response.payload.map((item) => item.totalView || 0);
      const totalRevenue = response.payload.map(
        (item) => item.totalRevenue || 0
      );

      // Thiết lập dữ liệu biểu đồ
      setChartDataTotalView({
        labels,
        datasets: [
          {
            label: "Total Views",
            data: totalView,
            borderColor: "rgba(255, 99, 132, 1)",
            backgroundColor: "rgba(255, 99, 132, 0.2)",
            borderWidth: 2,
            tension: 0.4,
            fill: true,
          },
        ],
      });
      setChartDataRevenue({
        labels,
        datasets: [
          {
            label: "Revenue (VND)",
            data: totalRevenue,
            borderColor: "rgba(75, 192, 192, 1)",
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            borderWidth: 2,
            tension: 0.4,
            fill: true,
          },
        ],
      });
    } catch (error) {
      console.error("Lỗi khi tải dữ liệu thống kê:", error);
    }
  };

  useEffect(() => {
    if (sessionStorage.getItem("role") == "Manager") loadStatistic();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionStorage.getItem("key")]);

  return (
    <div>
      {sessionStorage.getItem("role") === "Manager" ? (
        <Card style={{ height: 400, padding: 0 }}>
          <Typography.Title
            level={2}
            strong
            className="secondary--color"
            style={{ textAlign: "center" }}
          >
            Statistic System
          </Typography.Title>
          <Flex
            vertical
            gap="30px"
            style={{
              display: "flex",
              flexDirection: "row", // Hiển thị ngang
              gap: "30px", // Khoảng cách giữa hai biểu đồ
              justifyContent: "center", // Căn giữa các phần tử trong container
              alignItems: "center", // Căn giữa theo chiều dọc
            }}
          >
            <div style={{ width: "50%", margin: "0 auto" }}>
              <h2
                style={{
                  textAlign: "center",
                  margin: "20px",
                  marginTop: "10px",
                }}
              >
                Total Views Statistic
              </h2>
              {chartDataTotalView ? (
                <Line
                  data={chartDataTotalView}
                  options={{
                    responsive: true,
                    plugins: {
                      legend: {
                        display: true,
                        position: "top",
                      },
                      tooltip: { enabled: true },
                    },
                    layout: {
                      padding: {
                        top: 0, // Thêm padding phía trên biểu đồ để tạo không gian cho legend
                        bottom: 0, // Thêm padding phía dưới biểu đồ để kéo dài thêm
                      },
                    },
                    scales: {
                      x: { title: { display: true, text: "Month/Year" } },
                      y: {
                        title: { display: true },
                        beginAtZero: true,
                      },
                    },
                    elements: {
                      line: {
                        tension: 0.3, // Điều chỉnh độ cong của đường line (nếu muốn)
                      },
                    },
                  }}
                />
              ) : (
                <p>Đang tải dữ liệu...</p> // Hiển thị thông báo tải
              )}
            </div>
            <div style={{ width: "50%", margin: "0 auto" }}>
              <h2
                style={{
                  textAlign: "center",
                  margin: "20px",
                  marginTop: "10px",
                }}
              >
                Revenue Statistic
              </h2>
              {chartDataRevenue ? (
                <Line
                  data={chartDataRevenue}
                  options={{
                    responsive: true,
                    plugins: {
                      legend: { display: true, position: "top" },
                      tooltip: { enabled: true },
                    },
                    scales: {
                      x: { title: { display: true, text: "Month/Year" } },
                      y: {
                        title: { display: true },
                        beginAtZero: true,
                        ticks: {
                          padding: 10, // Thêm khoảng cách giữa các ticks của trục Y
                        },
                      },
                    },
                    elements: {
                      line: {
                        tension: 0.3, // Điều chỉnh độ cong của đường line (nếu muốn)
                      },
                    },
                  }}
                />
              ) : (
                <p>Đang tải dữ liệu...</p> // Hiển thị thông báo tải
              )}
            </div>
          </Flex>
        </Card>
      ) : (
        <Card style={{ height: 260, padding: 20 }}>
          <Flex vertical gap="30px">
            <Flex vertical align="flex-start">
              <Typography.Title level={2} strong>
                Easily monitor and manage MovieHub
              </Typography.Title>
              <Typography.Text type="secondary" strong>
                Modern management system helps you control the entire platform
                from one place.
              </Typography.Text>
            </Flex>

            <Flex direction="row" gap="large">
              <Button
                style={{ backgroundColor: "#536d79", color: "#fff" }}
                size="large"
                onClick={() => {
                  localStorage.setItem("key", "3");
                  navigate("/movie-admin");
                }}
              >
                Movie Management
              </Button>
              <Button
                size="large"
                onClick={() => {
                  localStorage.setItem("key", "2");
                  navigate("/account-admin");
                }}
              >
                User Management
              </Button>
            </Flex>
          </Flex>
        </Card>
      )}
    </div>
  );
}

export default Banner;
