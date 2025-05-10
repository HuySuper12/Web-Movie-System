/* eslint-disable react/prop-types */
import { Autoplay, Pagination } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/pagination";
import "./index.scss";

export default function Carousel({ numberOfSlides = 1, autoplay = true }) {
  return (
    <>
      <Swiper
        //Bao nhieu item tren 1 hang
        slidesPerView={numberOfSlides}
        //Tu chuyen canh carousel
        autoplay={{ delay: 2500, disableOnInteraction: false }}
        pagination={true}
        modules={autoplay ? [Pagination, Autoplay] : [Pagination]}
        className={`carousel ${numberOfSlides > 1 ? "multi-item" : ""}`}
      >
        <SwiperSlide>
          <img
            className="carousel__img"
            src="https://simg.zalopay.com.vn/zlp-website/assets/phim_viet_nam_chieu_rap_hay_nhat_3856301079.jpg"
            alt=""
          />
        </SwiperSlide>
        <SwiperSlide>
          <img
            className="carousel__img"
            src="https://tintuc-divineshop.cdn.vccloud.vn/wp-content/uploads/2023/12/nhin-lai-phim-dien-anh-viet-2023-doanh-thu-ruc-ro-tham-hoa-van-con_658b8bb3984d9.jpeg"
            alt=""
          />
        </SwiperSlide>
        <SwiperSlide>
          <img
            className="carousel__img"
            src="https://media.viez.vn/prod/2021/10/24/medium_1635100963003_9836af7d61.jpeg"
            alt=""
          />
        </SwiperSlide>
        <SwiperSlide>
          <img
            className="carousel__img"
            src="https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/2/8/phim-tet-2022-1-1644258923301219760067.png"
            alt=""
          />
        </SwiperSlide>
        <SwiperSlide>
          <img
            width={1920}
            className="carousel__img"
            src="https://mcdn.coolmate.me/image/October2023/13_29.jpg"
            alt=""
          />
        </SwiperSlide>
      </Swiper>
    </>
  );
}
