import {
  Button,
  Col,
  DatePicker,
  Form,
  Image,
  Input,
  InputNumber,
  Layout,
  Modal,
  Row,
  Select,
  Space,
  Table,
  Tabs,
} from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import {
  checkMovie,
  createMovie,
  deleteMovieInfo,
  loadMovies,
  loadPendingMovies,
  updateMovieInfo,
} from "../../redux/actions/movieAction";
import { useForm } from "antd/es/form/Form";
import TextArea from "antd/es/input/TextArea";
import dayjs from "dayjs";
import { loadMovieGenres } from "../../redux/actions/movieGenreAction";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import TabPane from "antd/es/tabs/TabPane";
import { debounce } from "lodash";
import { movieReset } from "../../redux/reducers/movieSlice";

const { Sider, Header, Content } = Layout;
function MovieAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.movie);
  const [activeTab, setActiveTab] = useState("true");

  const [open, setOpen] = useState(false);
  const [openDelete, setOpenDelete] = useState(false);
  const [openConfirm, setOpenConfirm] = useState(false);
  const [title, setTitle] = useState("Add New Movie");
  const [formVariable] = useForm();

  const [dataSource, setDataSource] = useState([]);
  const [movieGenres, setMovieGenres] = useState([]);
  const [genreName, setGenreName] = useState([]);
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
      title: "Release Date",
      dataIndex: "releaseDate",
      key: "releaseDate",
      align: "center",
    },
    {
      title: "Duration",
      dataIndex: "duration",
      key: "duration",
      align: "center",
    },
    {
      title: "Language",
      dataIndex: "language",
      key: "language",
      align: "center",
    },
    {
      title: "Director",
      dataIndex: "director",
      key: "director",
      align: "center",
    },
    {
      title: "Action",
      key: "action",
      align: "center",
      render: (_, record) => (
        <Space size="middle">
          <Button
            type="default"
            onClick={() => {
              handleOpen(record);
              setTitle("Edit Movie");
            }}
          >
            View Details
          </Button>
          {activeTab === "true" || activeTab === "false" ? (
            <Button
              color={activeTab === "true" ? "danger" : "primary"}
              variant="solid"
              onClick={() => {
                setOpenDelete(true);
                localStorage.setItem("movieId", record.movieId);
              }}
            >
              {activeTab === "true" ? "Delete" : "Restore"}
            </Button>
          ) : (
            <Button
              style={{
                backgroundColor: "#536d79",
                borderColor: "#536d79",
                color: "#fff",
              }}
              onClick={() => {
                setOpenConfirm(true);
                localStorage.setItem("movieId", record.movieId);
              }}
            >
              Confirm
            </Button>
          )}
        </Space>
      ),
    },
  ];

  const handleOpen = (record) => {
    setOpen(!open);
    //Add Genre
    setGenreName([]);
    for (let i = 0; i < record.genres.length; i++) {
      genreName.push(record.genres[i].genreName);
    }
    //Gan du lieu vao form
    localStorage.setItem("movieId", record.movieId);
    formVariable.setFieldsValue({
      title: record.title,
      description: record.description,
      releaseDate: dayjs(record.releaseDate),
      duration: record.duration,
      language: record.language,
      trailerUrl: record.trailerUrl,
      videoUrl: record.videoUrl,
      thumbnail: record.thumbnail,
      director: record.director,
      uploadedBy: record.uploadedBy,
      genreName: genreName,
    });
  };

  const handleSubmit = () => {
    formVariable.submit();
  };

  const handleFinishForm = async (values) => {
    if (title === "Add New Movie") {
      const data = {
        id: "0",
        title: values.title,
        description: values.description,
        releaseDate: dayjs(values.releaseDate).format("YYYY-MM-DD"),
        duration: values.duration,
        language: values.language,
        trailerUrl: values.trailerUrl,
        videoUrl: values.videoUrl,
        thumbnail: values.thumbnail,
        director: values.director,
        emailStaff: sessionStorage.getItem("email"),
        gerneName: values.genreName,
      };

      // const response = await createMovie(dispatch, data);
      const response = await dispatch(createMovie(data));
      if (response.payload.success === true) {
        toast.success("Create movie successfully!");
        loadMovie(true);
      } else {
        toast.error("Create movie failed!");
      }
    } else {
      const data = {
        id: localStorage.getItem("movieId"),
        title: values.title,
        description: values.description,
        releaseDate: dayjs(values.releaseDate).format("YYYY-MM-DD"),
        duration: values.duration,
        language: values.language,
        trailerUrl: values.trailerUrl,
        videoUrl: values.videoUrl,
        thumbnail: values.thumbnail,
        director: values.director,
        emailStaff: sessionStorage.getItem("email"),
        gerneName: values.genreName,
      };

      const response = await dispatch(updateMovieInfo(data));
      if (response.payload.success === true) {
        toast.success("Update movie successfully!");
        if (activeTab === "true") {
          loadMovie(true);
        } else if (activeTab === "false") {
          loadMovie(false);
        } else {
          loadMoviesPending(5);
        }
      } else {
        toast.error("Nothing change");
      }
      localStorage.removeItem("movieId");
      reloadState(); //Cho no cap nhat lai list khi update va addmovie
    }
    formVariable.resetFields();
    setOpen(!open);
  };

  const handleDeleteMovie = async () => {
    const movieId = localStorage.getItem("movieId");
    // const response = await deleteMovieInfo(dispatch, movieId);
    const response = await dispatch(deleteMovieInfo({ id: movieId }));
    if (response.payload.success === true) {
      if (activeTab === "false") {
        toast.success("Restore movie successfully!");
        loadMovie(false);
      } else {
        toast.success("Delete movie successfully!");
        loadMovie(true);
      }
      localStorage.removeItem("movieId");
    } else {
      toast.error("Delete movie failed!");
    }
    setOpenDelete(!openDelete);
    reloadState(); //Cho no cap nhat lai list khi update va addmovie
  };

  const handleCheckMovie = async (status) => {
    const movieId = localStorage.getItem("movieId");
    const response = await dispatch(checkMovie({ movieId, status }));

    if (response.payload.success === true) {
      toast.success("Check movie successfully");
      loadMoviesPending(5);
      localStorage.removeItem("movieId");
    } else {
      toast.error("Check movie failed!");
    }
    setOpenConfirm(!openConfirm);
    reloadState(); //Cho no cap nhat lai list khi update va addmovie
  };

  const loadMoviesPending = async (pageSize) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastMovies === "") {
      if (selector.lastMovieId !== 0 && dataSource.length === 0) {
        setLastMovies(selector.lastMovieId);
        setDataSource(selector.movie);
      } else {
        const param = {
          pageSize: pageSize,
          movieId: "1000000",
        };
        const response = await dispatch(loadPendingMovies(param));
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }

        setLastMovies(
          response.payload.data[response.payload.data.length - 1].movieId
        );
        setDataSource(response.payload.data);
      }
    } else {
      const param = {
        pageSize: pageSize,
        movieId: lastMovies,
      };
      const response = await dispatch(loadPendingMovies(param));
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      setLastMovies(
        response.payload.data[response.payload.data.length - 1].movieId
      );
      setDataSource((pre) => [...pre, ...response.payload.data]);
    }
    setLoading(false);
  };

  const loadMovie = async (status) => {
    if (loading || !hasMore) return;
    setLoading(true);

    if (lastMovies === "") {
      if (
        selector.lastMovieId !== 0 &&
        dataSource.length === 0 &&
        selector.activeTab === activeTab
      ) {
        setLastMovies(selector.lastMovieId);
        setDataSource(selector.movie);
      } else {
        const param = {
          status: status,
          pageSize: pageSize,
          movieId: "1000000",
        };
        const response = await dispatch(loadMovies(param));
        if (response.payload.error === true) {
          setHasMore(false);
          return;
        }
        setLastMovies(
          response.payload.data[response.payload.data.length - 1].movieId
        );
        setDataSource(response.payload.data);
      }
    } else {
      const param = { status: status, pageSize: pageSize, movieId: lastMovies };
      const response = await dispatch(loadMovies(param));
      if (response.payload.error === true) {
        setHasMore(false);
        return;
      }

      setLastMovies(
        response.payload.data[response.payload.data.length - 1].movieId
      );
      setDataSource((pre) => [...pre, ...response.payload.data]);
    }
    setLoading(false);
  };

  const loadGenre = async () => {
    const response = await dispatch(loadMovieGenres());
    setMovieGenres(response.payload.data);
  };

  const reloadState = () => {
    setLoading(false);
    setHasMore(true);
    setLastMovies("");
    setDataSource([]);
    dispatch(movieReset(activeTab));
  };

  const handleScroll = debounce(async () => {
    if (
      window.innerHeight + window.scrollY >=
      document.body.offsetHeight - 500
    ) {
      if (activeTab === "true" || activeTab === "false") {
        await loadMovie(activeTab);
      } else if (activeTab === "pending") {
        await loadMoviesPending(pageSize);
      }
    }
  }, 750);

  //UseEffect nay dung khi doi tab
  useEffect(() => {
    reloadState();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeTab]);

  useEffect(() => {
    if (dataSource.length == 0) {
      if (activeTab === "true" || activeTab === "false") {
        loadMovie(activeTab);
      } else {
        loadMoviesPending(pageSize);
      }
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

    loadGenre(dispatch);

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeTab, loading, lastMovies]);
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
          <div className="tabs-container">
            <Button
              className={
                sessionStorage.getItem("role") === "Staff"
                  ? "custom-button-staff"
                  : "custom-button-manager"
              }
              onClick={() => {
                setOpen(!open);
                setTitle("Add New Movie");
                formVariable.resetFields();
              }}
            >
              Add New Movie
            </Button>
            {sessionStorage.getItem("role") === "Manager" && (
              <Tabs
                defaultActiveKey={activeTab}
                className="custom-tabs"
                onChange={(key) => {
                  setActiveTab(key);
                  dispatch(movieReset(key));
                }}
              >
                <TabPane tab="Pending" key="pending" />
                <TabPane tab="Active" key="true" />
                <TabPane tab="Deleted" key="false" />
              </Tabs>
            )}
          </div>
          <Table
            dataSource={dataSource}
            columns={columns}
            pagination={false}
            rowKey={(record) => record.movieId}
          />
          <Modal
            width={1000}
            style={{ top: 60 }} // Dịch modal lên 30px
            title={title}
            open={open}
            onOk={handleSubmit}
            onCancel={() => {
              setOpen(!open);
              formVariable.resetFields();
              localStorage.removeItem("movieId");
            }}
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
            <Form
              form={formVariable}
              labelCol={{ span: 24 }}
              onFinish={handleFinishForm}
            >
              <Row gutter={24}>
                {/* Cột 1 */}
                <Col xs={24} sm={12} md={8}>
                  <Form.Item
                    label="Title"
                    name="title"
                    rules={[
                      { required: true, message: "Please enter the title!" },
                    ]}
                  >
                    <Input placeholder="Enter movie title" />
                  </Form.Item>

                  <Form.Item
                    label="Language"
                    name="language"
                    rules={[
                      { required: true, message: "Please enter the language!" },
                    ]}
                  >
                    <Input placeholder="Enter movie language" />
                  </Form.Item>

                  <Form.Item
                    label="Director"
                    name="director"
                    rules={[
                      { required: true, message: "Please enter the director!" },
                    ]}
                  >
                    <Input placeholder="Enter director's name" />
                  </Form.Item>
                </Col>

                {/* Cột 2 */}
                <Col xs={24} sm={12} md={8}>
                  <Form.Item
                    label="Duration (minutes)"
                    name="duration"
                    rules={[
                      { required: true, message: "Please enter the duration!" },
                    ]}
                  >
                    <InputNumber
                      min={0}
                      placeholder="Enter duration in minutes"
                      style={{ width: "100%" }}
                    />
                  </Form.Item>

                  <Form.Item
                    label="Release Date"
                    name="releaseDate"
                    rules={[
                      {
                        required: true,
                        message: "Please select the release date!",
                      },
                    ]}
                  >
                    <DatePicker style={{ width: "100%" }} />
                  </Form.Item>

                  <Form.Item
                    label="Genre"
                    name="genreName"
                    rules={[
                      {
                        required: true,
                        message: "Please select at least one genre!",
                      },
                    ]}
                  >
                    <Select
                      mode="multiple"
                      placeholder="Select genres"
                      allowClear
                    >
                      {movieGenres.map((genre) => (
                        <Select.Option
                          value={genre.genreName}
                          key={genre.genreId}
                        >
                          {genre.genreName}
                        </Select.Option>
                      ))}
                    </Select>
                  </Form.Item>
                </Col>

                {/* Cột 3 */}
                <Col xs={24} sm={12} md={8}>
                  <Form.Item
                    label="Thumbnail"
                    name="thumbnail"
                    rules={[
                      {
                        required: true,
                        message: "Please enter the thumbnail URL!",
                      },
                    ]}
                  >
                    <Input placeholder="Enter thumbnail URL" />
                  </Form.Item>

                  <Form.Item
                    label="Trailer URL"
                    name="trailerUrl"
                    rules={[
                      {
                        required: true,
                        message: "Please enter the trailer URL!",
                      },
                    ]}
                  >
                    <Input placeholder="Enter trailer URL" />
                  </Form.Item>

                  <Form.Item
                    label="Video URL"
                    name="videoUrl"
                    rules={[
                      {
                        required: true,
                        message: "Please enter the video URL!",
                      },
                    ]}
                  >
                    <Input placeholder="Enter video URL" />
                  </Form.Item>
                </Col>

                {/* TextArea chiếm toàn bộ hàng */}
                <Col span={24}>
                  <Form.Item
                    label="Description"
                    name="description"
                    rules={[
                      {
                        required: true,
                        message: "Please enter the description!",
                      },
                    ]}
                  >
                    <TextArea rows={4} placeholder="Enter movie description" />
                  </Form.Item>
                </Col>
              </Row>
            </Form>
          </Modal>
          <Modal
            title={activeTab == "true" ? "Delete Movie" : "Restore Movie"}
            open={openDelete}
            onOk={handleDeleteMovie}
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
            <p>
              {activeTab == "true"
                ? "Are you really to delete movie???"
                : "Are you really to restore movie???"}
            </p>
          </Modal>
          <Modal
            title="Content Quality Verification"
            open={openConfirm}
            onCancel={() => setOpenConfirm(!openConfirm)}
            footer={null}
          >
            <p>Please check carefully before accepting to avoid mistakes!</p>
            <div style={{ textAlign: "right", marginTop: "20px" }}>
              <Button
                onClick={() => setOpenConfirm(false)}
                style={{
                  color: "#5a6c76",
                  borderColor: "#5a6c76",
                  marginRight: "8px",
                }}
              >
                Cancel
              </Button>
              <Button
                onClick={() => handleCheckMovie(false)}
                style={{
                  backgroundColor: "#e74c3c",
                  borderColor: "#e74c3c",
                  color: "#fff",
                  marginRight: "8px",
                }}
              >
                Reject
              </Button>
              <Button
                onClick={() => handleCheckMovie(true)}
                style={{
                  backgroundColor: "#536d79",
                  borderColor: "#536d79",
                  color: "#fff",
                }}
              >
                Accept
              </Button>
            </div>
          </Modal>
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

export default MovieAdmin;
