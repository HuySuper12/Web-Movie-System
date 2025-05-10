import "./index.scss";

// eslint-disable-next-line react/prop-types
const MoviePopup = ({ show, movieTitle, videoUrl, onClose }) => {
  if (!show) return null;

  return (
    <div className="movie-popup-overlay">
      <div className="movie-popup">
        <button className="close-buttons" onClick={onClose}>
          &times;
        </button>
        <h2 className="movie-title">{movieTitle}</h2>
        <div className="video-container">
          <iframe
            src={videoUrl}
            title={movieTitle}
            frameBorder="0"
            allow="autoplay; fullscreen"
            allowFullScreen
          ></iframe>
        </div>
      </div>
    </div>
  );
};

export default MoviePopup;
