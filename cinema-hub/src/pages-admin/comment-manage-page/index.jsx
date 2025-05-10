import { Button, Layout, Modal, Space, Table } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";

import { useDispatch, useSelector } from "react-redux";

import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import {
  handleSearchAccount,
  viewProfileId,
} from "../../redux/actions/accountAction";
import {
  getMovieDetailById,
  searchMovieName,
  viewMovieTitle,
} from "../../redux/actions/movieAction";
import { viewAllComments } from "../../redux/actions/commentAction";
import {
  addViolationFirst,
  addViolationSecond,
} from "../../redux/actions/notificationAction";
import { debounce } from "lodash";
import { commentChange } from "../../redux/reducers/commentSlice";

const { Sider, Header, Content } = Layout;
function CommentAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.comment);
  const selectorAccount = useSelector((state) => state.account);
  const selectorMovie = useSelector((state) => state.movie);

  const [status, setStatus] = useState(false);
  const [nameCache, setNameCache] = useState({}); // Cache tên nhân viên
  const [violationCountCache, setViolationCountCache] = useState({}); // Cache tên nhân viên
  const [movieCache, setMovieCache] = useState({}); // Cache tên phim

  const [openDelete, setOpenDelete] = useState(false);
  const [dataDisable, setDataDisable] = useState({});

  const [movieList, setMovieList] = useState([]);
  const [dataSource, setDataSource] = useState([]);
  // eslint-disable-next-line no-unused-vars
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 8; // Số bản ghi mỗi trang

  const [lastComment, setLastComment] = useState("");
  const [loading, setLoading] = useState(false);
  const [hasMore, setHasMore] = useState(true);

  const columns = [
    {
      title: "No",
      dataIndex: "key",
      align: "center",
      width: 70,
      render: (text, record, index) => {
        // Kiểm tra dữ liệu nếu cần thiết
        return (currentPage - 1) * pageSize + index + 1;
      }, // Tính STT, // Thêm số thứ tự
    },
    {
      title: (
        <div style={{ textAlign: "center", width: "100%" }}>User Name</div>
      ),
      dataIndex: "userId",
      key: "userId",
      align: "left",
      width: 150,
      render: (userId) => nameCache[userId] || "Loading...", // Chỉ lấy từ cache,
    },
    {
      title: <div style={{ textAlign: "center", width: "100%" }}>Title</div>,
      dataIndex: "movieId",
      key: "movieId",
      align: "left",
      width: 150,
      render: (movieId) => movieCache[movieId] || "Loading...", // Chỉ lấy từ cache,
      filters: movieList.map((item) => ({
        text: item,
        value: item,
      })),
      onFilter: (value, record) => {
        const movieName = movieCache[record.movieId]; // Lấy tên từ cache thay vì gọi hàm
        return movieName === value;
      },
    },
    {
      title: <div style={{ textAlign: "center", width: "100%" }}>Content</div>,
      dataIndex: "content",
      key: "content",
      align: "left",
      width: 300,
    },
    {
      title: "Created At",
      dataIndex: "createdAt",
      key: "createdAt",
      align: "center",
      render: (createdAt) => {
        return new Date(createdAt).toLocaleString();
      },
      width: 100,
    },
    {
      title: "Status",
      dataIndex: "status",
      key: "status",
      align: "center",
      width: 60,
      render: (status) => {
        return status === true ? "Active" : "Disable";
      },
    },
    {
      title: "Warning Action",
      key: "action",
      align: "center",
      width: 70,
      render: (_, record) => (
        <Space size="middle">
          {record.status === true &&
            violationCountCache[record.userId] === 0 && (
              <Button
                color="primary"
                variant="solid"
                onClick={() =>
                  handleViolationFirst(
                    sessionStorage.getItem("email"),
                    record.userId,
                    record.commentId
                  )
                }
              >
                Notification
              </Button>
            )}
          {record.status === true &&
            violationCountCache[record.userId] === 1 && (
              <Button
                color="danger"
                variant="solid"
                onClick={() => {
                  setOpenDelete(!openDelete);
                  setDataDisable(record);
                }}
              >
                Disable Account
              </Button>
            )}
        </Space>
      ),
    },
  ];

  //Load ra ten tu Id
  const handleSearchNameAndViolation = async (id) => {
    if (nameCache[id]) {
      // Nếu đã có trong cache, trả về ngay
      return nameCache[id];
    }

    // Nếu đã có trong cache redux, trả về ngay
    if (selectorAccount.accountSearchName[id] !== undefined) {
      setNameCache((prev) => ({
        ...prev,
        [id]: selectorAccount.accountSearchName[id], // Lưu kết quả vào cache
      }));
      setViolationCountCache((prev) => ({
        ...prev,
        [id]: selectorAccount.violationCount[id], // Lưu kết quả vào cache
      }));
      return;
    }

    // Nếu chưa có, gọi API để lấy dữ liệu
    const response = await dispatch(viewProfileId(id));
    const fullName = response.payload.data.fullName;
    setNameCache((prev) => ({
      ...prev,
      [id]: fullName, // Lưu kết quả vào cache
    }));
    const violationCount = response.payload.data.violationCount;
    setViolationCountCache((prev) => ({
      ...prev,
      [id]: violationCount, // Lưu kết quả vào cache
    }));
    const data = {
      id: id,
      fullName: response.payload.data.fullName,
      violation: response.payload.data.violationCount,
    };

    handleSearchAccount(dispatch, data);
    return fullName;
  };

  const handleMovieName = async (id) => {
    if (movieCache[id]) {
      // Nếu đã có trong cache state, trả về ngay
      return movieCache[id];
    }

    // Nếu đã có trong cache redux, trả về ngay
    if (selectorMovie.movieSearchNames[id] !== undefined) {
      setMovieCache((prev) => ({
        ...prev,
        [id]: selectorMovie.movieSearchNames[id], // Lưu kết quả vào cache
      }));
      return;
    }

    // Nếu chưa có, gọi API để lấy dữ liệu
    const response = await dispatch(getMovieDetailById({ id: id }));
    const title = response.payload.data.title;
    setMovieCache((prev) => ({
      ...prev,
      [id]: title, // Lưu kết quả vào cache
    }));
    const data = {
      id: id,
      title: response.payload.data.title,
    };
    searchMovieName(dispatch, data);
    return title;
  };

  //Canh bao vi pham lan 1
  const handleViolationFirst = async (staffEmail, userId, commentId) => {
    dispatch(commentChange());
    const response = await dispatch(
      addViolationFirst({ staffEmail, userId, commentId })
    );

    if (response.payload.success === true) {
      toast.success("Warning successfully");
      setStatus(!status);
      //Do thuoc tinh trong bang ko tu render nen phai set lai violationCountCache de render lai bang
      setViolationCountCache((prev) => ({
        ...prev,
        [userId]: 1,
      }));
    } else {
      toast.error("Warning failed");
    }
    reloadState();
  };

  //Canh bao vi pham lan 2
  const handleViolationSecond = async () => {
    dispatch(commentChange());
    const response = await dispatch(
      addViolationSecond({
        staffEmail: sessionStorage.getItem("email"),
        userId: dataDisable.userId,
        commentId: dataDisable.commentId,
      })
    );
    if (response.payload.success === true) {
      toast.success("Disable account successfully");
      setStatus(!status);
      setOpenDelete(!openDelete);
      //Do thuoc tinh trong bang ko tu render nen phai set lai violationCountCache de render lai bang
      setViolationCountCache((prev) => ({
        ...prev,
        [dataDisable.userId]: 2,
      }));
    } else {
      toast.error("Disable account failed");
    }
    reloadState();
  };

  const loadMovieTitle = async () => {
    if (selector.movieTitle !== undefined) {
      setMovieList(selector.movieTitle);
      return;
    }
    const response = await dispatch(viewMovieTitle());
    setMovieList(response.payload.data);
  };

  const reloadState = () => {
    setLoading(false);
    setHasMore(true);
    setLastComment("");
    setDataSource([]);
  };

  const loadComment = async (pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastComment === "") {
      if (selector.lastCommentId !== 0 && lastComment === "") {
        setDataSource(selector.comment);
        setLastComment(selector.lastCommentId);
        //Promise thay cho dòng for
        await Promise.all(
          selector.comment.map((item) => {
            return Promise.all([
              handleMovieName(item.movieId),
              handleSearchNameAndViolation(item.userId),
            ]);
          })
        );
      } else {
        const response = await dispatch(
          viewAllComments({ pageSize: pageSize, commentId: "1000000" })
        );

        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        await Promise.all(
          response.payload.data.map((item) =>
            Promise.all([
              handleMovieName(item.movieId),
              handleSearchNameAndViolation(item.userId),
            ])
          )
        );

        setLastComment(
          response.payload.data[response.payload.data.length - 1].commentId
        );
        setDataSource(response.payload.data);
      }
    } else {
      const response = await dispatch(
        viewAllComments({ pageSize: pageSize, commentId: lastComment })
      );

      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      await Promise.all(
        response.payload.data.map((item) =>
          Promise.all([
            handleMovieName(item.movieId),
            handleSearchNameAndViolation(item.userId),
          ])
        )
      );

      setLastComment(
        response.payload.data[response.payload.data.length - 1].commentId
      );
      setDataSource((pre) => [...pre, ...response.payload.data]);
    }

    setLoading(false);
  };

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      await loadComment(pageSize);
    }
  }, 500);

  useEffect(() => {
    if (dataSource.length === 0) {
      loadMovieTitle(dispatch);
      loadComment(pageSize);
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
    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [status, loading, lastComment, selector.isChange]);
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
            // pagination={{
            //   pageSize: pageSize,
            //   current: currentPage,
            //   onChange: (page) => setCurrentPage(page), // Đảm bảo rằng currentPage được truyền vào
            // }}
            rowKey={(record) => record.commentId}
          />
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
        </Content>
      </Layout>

      <Modal
        title="Disable Account"
        open={openDelete}
        onOk={handleViolationSecond}
        onCancel={() => setOpenDelete(!openDelete)}
        okButtonProps={{
          style: {
            backgroundColor: "#536d79",
            borderColor: "#536d79",
            color: "#fff",
          }, // Thay đổi màu nút Ok
        }}
        cancelButtonProps={{
          style: {
            color: "#5a6c76", // Màu chữ nút Cancel giống Ok
            borderColor: "#5a6c76", // Màu viền giống Ok
          },
        }}
      >
        <p>Are you really to disable account???</p>
      </Modal>
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

export default CommentAdmin;
