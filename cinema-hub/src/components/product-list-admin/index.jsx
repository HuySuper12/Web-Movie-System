import { Button, Card, Flex, Image, Typography } from "antd";
import "./index.scss";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { loadMovies } from "../../redux/actions/movieAction";

function ProductListAdmin() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [dataSource, setDataSource] = useState([]);

  const handleViewAll = () => {
    localStorage.setItem("key", 3);
    navigate("/movie-admin");
  };

  const viewRatingStatistic = async (dispatch, status) => {
    const param = { status: status, pageSize: 4, movieId: "1000000" };
    const response = await dispatch(loadMovies(param));
    setDataSource(response.payload.data);
  };

  useEffect(() => {
    if (dataSource.length == 0) {
      viewRatingStatistic(dispatch, true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionStorage.getItem("key")]);

  return (
    <>
      <Flex align="center" justify="space-between">
        <Typography.Title level={2} strong className="secondary--color">
          Top New Movie
        </Typography.Title>
        <Button className="gray--color" onClick={handleViewAll}>
          View All
        </Button>
      </Flex>

      <Flex align="center" gap="large">
        {dataSource.map((movie, index) => (
          <Card key={index} hoverable className="movie-card-admin">
            <Image
              src={movie.thumbnail}
              alt={movie.title}
              style={{
                width: "100%",
                height: 205,
                objectFit: "cover",
                borderRadius: 10,
              }}
            />
          </Card>
        ))}
      </Flex>
    </>
  );
}

export default ProductListAdmin;
