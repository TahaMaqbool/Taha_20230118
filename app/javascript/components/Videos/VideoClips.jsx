import React, { useState, useEffect } from "react";
export const VideoClips = () => {

  const [videos, setVideos] = useState([]);

  useEffect(() => {
    const url = "/videos";
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error("Server Error");
      })
      .then((res) =>  setVideos(res))
      .catch((error) => console.log(error.message));
  }, []);

  return (<>
    <div className="container mt-5">
      <h1>All Videos</h1>
        <div className="row mt-5">
          {videos.map((video) => (
            <div className="col-md-3" key={video.id}>
              <div className="card mb-4 shadow-sm video-card">
                <div className="my-3 mx-2 d-flex justify-content-between align-items-center">
                  <h5 className="card-text">{video.title}</h5>
                  <span className="badge bg-primary">{video.category}</span>
                </div>
                <video className="bd-placeholder-img card-img-top" width="100%" height="100%" controls>
                    <source src={video.video_clip} />
                  </video>
                </div>
            </div>
          ))}
        </div>
    </div>
  </>)
};
