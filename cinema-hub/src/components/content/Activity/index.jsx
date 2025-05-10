import { Avatar, Button, Flex, List, Typography } from "antd";
import "./index.scss";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import { viewRatingStatisticAdmin } from "../../../redux/actions/ratingAction";
import { useDispatch } from "react-redux";

function Activity() {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const [dataSource, setDataSource] = useState([]);

  const handleViewAll = () => {
    localStorage.setItem("key", 5);
    navigate("/view-rating-admin");
  };

  const viewRatingStatistic = async (status) => {
    const response = await dispatch(
      viewRatingStatisticAdmin({
        status: status,
        pageSize: 10,
        lastMovieId: "1000000",
      })
    );
    setDataSource(response.payload.data);
  };

  useEffect(() => {
    if (dataSource.length == 0) {
      viewRatingStatistic(true);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [sessionStorage.getItem("key")]);

  return (
    <Flex vertical className="activity-containers">
      <Flex align="center" justify="space-between">
        <Typography.Title level={4} strong className="secondary--color">
          Access New Movie
        </Typography.Title>
        <Button className="gray--color" onClick={handleViewAll}>
          View All
        </Button>
      </Flex>

      <List
        pagination={{ pageSize: 5 }}
        dataSource={dataSource}
        renderItem={(movie) => (
          <List.Item>
            <List.Item.Meta
              avatar={<Avatar src={movie.thumbnail} size={40} />}
              title={movie.title}
              description={movie.director}
            />
            <span className="gray--color">⭐ {movie.averageRating}/5</span>
          </List.Item>
        )}
      />
    </Flex>
  );
}

export default Activity;
