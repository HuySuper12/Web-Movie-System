import { Button, Form, Input, Layout, Modal, Space, Table } from "antd";
import { useEffect, useState } from "react";
import SideBarAdmin from "../../components/side-bar-admin";
import "./index.scss";
import { MenuUnfoldOutlined, MenuFoldOutlined } from "@ant-design/icons";
import HeaderAdmin from "../../components/header/header-admin";
import { useNavigate } from "react-router-dom";
import {
  AddGenre,
  EditGenre,
  loadMovieGenres,
  removeGenre,
} from "../../redux/actions/movieGenreAction";
import { useDispatch, useSelector } from "react-redux";
import { useForm } from "antd/es/form/Form";
import { Bounce, toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

const { Sider, Header, Content } = Layout;
function MovieGerneAdmin() {
  const [collapsed, setCollapsed] = useState(false);
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const selector = useSelector((state) => state.movieGenre);

  const [open, setOpen] = useState(false);
  const [formVariable] = useForm();
  const [title, setTitle] = useState("Add Genre");

  const [openDelete, setOpenDelete] = useState(false);

  const [dataSource, setDataSource] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const pageSize = 8; // Số bản ghi mỗi trang

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
      title: "Genre Id",
      dataIndex: "genreId",
      key: "genreId",
      align: "center",
    },
    {
      title: "Genre Name",
      dataIndex: "genreName",
      key: "genreName",
      align: "center",
    },
    {
      title: "Action",
      key: "action",
      align: "center",
      render: (_, record) => (
        <Space size="middle">
          <Button
            type="primary"
            onClick={() => {
              handleEditGenre(record);
            }}
          >
            Edit
          </Button>
          <Button
            color="danger"
            variant="solid"
            onClick={() => {
              setOpenDelete(!openDelete);
              localStorage.setItem("genreId", record.genreId);
            }}
          >
            Delete
          </Button>
        </Space>
      ),
    },
  ];

  const handleEditGenre = (record) => {
    setOpen(!open);
    setTitle("Edit Genre");
    formVariable.setFieldsValue({
      genreName: record.genreName,
    });
    localStorage.setItem("genreId", record.genreId);
  };

  const handleSubmit = () => {
    formVariable.submit();
  };

  const handleFinishForm = async (values) => {
    if (title === "Add New Genre") {
      const data = {
        genreId: 0,
        genreName: values.genreName,
      };

      const response = await dispatch(AddGenre(data));
      if (response.payload.success == true) {
        setOpen(!open);
        loadGenre();
        toast.success("Add Genre Successfully");
      }
    } else {
      const data = {
        genreId: localStorage.getItem("genreId"),
        genreName: values.genreName,
      };
      const response = await dispatch(EditGenre(data));
      if (response.payload.success == true) {
        setOpen(!open);
        loadGenre();
        toast.success("Edit Genre Successfully");
        localStorage.removeItem("genreId");
      } else {
        toast.error("Nothing change");
        setOpen(!open);
        localStorage.removeItem("genreId");
      }
    }
  };

  const handleDelete = async () => {
    const response = await dispatch(
      removeGenre({ id: localStorage.getItem("genreId") })
    );
    if (response.payload.success == true) {
      loadGenre();
      toast.success("Delete Genre Successfully");
      localStorage.removeItem("genreId");
      setOpenDelete(!openDelete);
    }
  };

  const loadGenre = async () => {
    const response = await dispatch(loadMovieGenres());
    setDataSource(response.payload.data);
  };

  useEffect(() => {
    if (
      sessionStorage.getItem("role") !== "Staff" &&
      sessionStorage.getItem("role") !== "Manager"
    ) {
      navigate("/");
    }
    selector.movieGenre.length > 0
      ? setDataSource(selector.movieGenre)
      : loadGenre();
    window.scrollTo(0, 0);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
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
          <Button
            className="custom-button"
            onClick={() => {
              setOpen(!open);
              setTitle("Add New Genre");
              formVariable.resetFields();
            }}
          >
            Add New Genre
          </Button>
          <Table
            dataSource={dataSource}
            columns={columns}
            pagination={{
              pageSize: pageSize,
              current: currentPage,
              onChange: (page) => setCurrentPage(page), // Đảm bảo rằng currentPage được truyền vào
            }}
            rowKey={(record) => record.genreId}
          />
        </Content>
      </Layout>
      <Modal
        title={title}
        open={open}
        onOk={handleSubmit}
        onCancel={() => setOpen(!open)}
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
          <Form.Item label="Genre Name" name="genreName">
            <Input />
          </Form.Item>
        </Form>
      </Modal>

      <Modal
        title="Delete Genre"
        open={openDelete}
        onOk={handleDelete}
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
        <p>Are you really to delete genre???</p>
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

export default MovieGerneAdmin;
