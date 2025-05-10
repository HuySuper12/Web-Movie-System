import { Card, Flex, Image } from "antd";
import "./index.scss";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { countView } from "../../../redux/actions/watchHistoryAction";

function SideBarContent() {
  const dispatch = useDispatch();

  const [viewToday, setViewToday] = useState(0);
  const [viewMonth, setViewMonth] = useState(0);

  const loadViewDate = async (status) => {
    const response = await dispatch(countView({ search: status }));
    if (response.payload.error === true) {
      setViewToday(0);
    }
    setViewToday(response.payload.data);
  };

  const loadViewMonth = async (status) => {
    const response = await dispatch(countView({ search: status }));
    if (response.payload.error === true) {
      setViewMonth(0);
    }
    setViewMonth(response.payload.data);
  };

  useEffect(() => {
    loadViewDate("today");
    loadViewMonth("month");
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <div>
      <Card>
        <Flex vertical gap="30px">
          <div className="sidebar-containers">
            <div className="sidebar-title">Total Views Report</div>
            <div className="sidebar-text">
              Today <br /> {viewToday} views
            </div>
            <div className="sidebar-text">
              This Month <br /> {viewMonth} views
            </div>
          </div>
        </Flex>
        <Image
          src="https://c8.alamy.com/comp/2T1P7T2/movie-time-hand-drawing-lettering-creative-template-for-cinema-poster-banner-movie-time-concept-with-cinema-elements-vector-illustration-2T1P7T2.jpg"
          style={{
            position: "absolute",
            bottom: -10,
            left: 130,
            height: "170px",
            width: "auto",
            boxShadow: "0 10px 10px 1px rgba(0, 0, 0, 0.63)",
            borderRadius: "20px",
          }}
        />
      </Card>
    </div>
  );
}

export default SideBarContent;
