import { Button, Image, Layout, Table } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { Bounce, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { viewRatingStatisticAdmin } from "../../redux/actions/ratingAction";
import { debounce } from "lodash";

const { Sider, Header, Content } = Layout;
function ViewRatingAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.rating);

  const [avgRatingList, setAvgRatingList] = useState([]);
  const [dataSource, setDataSource] = useState([]);
  // eslint-disable-next-line no-unused-vars
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 5; // Số bản ghi mỗi trang

  const [lastMovies, setLastMovies] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  const columns = [
    {
      title: "No",
      dataIndex: "key",
      align: "center",
      render: (text, record, index) => {
        // Kiểm tra dữ liệu nếu cần thiết
        return (currentPage - 1) * pageSize + index + 1;
      }, // Tính STT, // Thêm số thứ tự
    },
    {
      title: "Poster",
      dataIndex: "thumbnail",
      key: "thumbnail",
      align: "center",
      render: (thumbnail) => (
        <center>
          <Image src={thumbnail} alt="profile" width="180px" height="240px" />
        </center>
      ),
    },
    {
      title: "Title",
      dataIndex: "title",
      key: "title",
      align: "center",
    },
    {
      title: "Director",
      dataIndex: "director",
      key: "director",
      align: "center",
    },
    {
      title: "AVG Rating",
      dataIndex: "averageRating",
      key: "averageRating",
      align: "center",
      filters: avgRatingList.map((item) => ({
        text: item,
        value: item,
      })),
      onFilter: (value, record) => record.averageRating === value,
    },
    {
      title: "Total Ratings",
      dataIndex: "totalRatings",
      key: "totalRatings",
      align: "center",
    },
    {
      title: "Total Views",
      dataIndex: "totalViews",
      key: "totalViews",
      align: "center",
    },
  ];

  const viewRatingStatistic = async (status, pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastMovies === "") {
      if (lastMovies === "" && selector.lastRatingId !== 0) {
        setLastMovies(selector.lastRatingId);
        setDataSource(selector.rating);
        setAvgRatingList(
          selector.rating
            .map((item) => item.averageRating)
            .filter((value, index, self) => self.indexOf(value) === index)
        );
      } else {
        const response = await dispatch(
          viewRatingStatisticAdmin({
            status: status,
            pageSize: pageSize,
            lastMovieId: "1000000",
          })
        );

        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        for (let i = 0; i < response.payload.data.length; i++) {
          if (!avgRatingList.includes(response.payload.data[i].averageRating)) {
            avgRatingList.push(response.payload.data[i].averageRating);
          }
        }
        setAvgRatingList(
          response.payload.data
            .map((item) => item.averageRating)
            .filter((value, index, self) => self.indexOf(value) === index)
        );
        setLastMovies(
          response.payload.data[response.payload.data.length - 1].id
        );
        setDataSource(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewRatingStatisticAdmin({
          status: status,
          pageSize: pageSize,
          lastMovieId: lastMovies,
        })
      );

      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      for (let i = 0; i < response.payload.data.length; i++) {
        if (!avgRatingList.includes(response.payload.data[i].averageRating)) {
          avgRatingList.push(response.payload.data[i].averageRating);
        }
      }
      setAvgRatingList(
        response.payload.data
          .map((item) => item.averageRating)
          .filter((value, index, self) => self.indexOf(value) === index)
      );
      setLastMovies(response.payload.data[response.payload.data.length - 1].id);
      setDataSource((pre) => [...pre, ...response.payload.data]);
    }

    setLoading(false);
  };

  //Day la ham xu ly scroll lazy load
  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await viewRatingStatistic(true, pageSize);
    }
  }, 500);

  useEffect(() => {
    if (dataSource.length === 0) {
      viewRatingStatistic(true, pageSize);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [dataSource]);

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }

    // window.scrollTo(0, 0);
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [loading, selector.isChange, lastMovies]);
  return (
    <Layout>
      <Sider
        theme="light"
        trigger={null}
        collapsible
        collapsed={collapsed}
        className="sider"
      >
        <SideBarAdmin />

        <Button
          type="text"
          icon={collapsed ? <MenuUnfoldOutlined /> : <MenuFoldOutlined />}
          onClick={() => setCollapsed(!collapsed)}
          className="trigger-btn"
        />
      </Sider>
      <Layout>
        <Header className="headers">
          <HeaderAdmin />
        </Header>
        <Content className="content">
          <Table
            dataSource={dataSource}
            columns={columns}
            pagination={false}
            rowKey={(record) => record.title}
          />
        </Content>
        <div style={{ padding: "10px 0", textAlign: "center" }}>
          {window.innerHeight + window.scrollY >=
          document.body.offsetHeight - 500
            ? hasMore && (
                <div className="loading-containers">
                  <div className="spinners"></div>
                  <p className="loading-texts">Please wait...</p>
                </div>
              )
            : null}
        </div>
      </Layout>
      <ToastContainer
        position="top-right"
        autoClose={5000}
        hideProgressBar={false}
        newestOnTop={false}
        closeOnClick
        rtl={false}
        pauseOnFocusLoss
        draggable
        pauseOnHover
        theme="light"
        transition={Bounce}
      />
    </Layout>
  );
}

export default ViewRatingAdmin;
