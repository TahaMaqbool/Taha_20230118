import * as React from "react";

export const NewVideo = () => {

  const [video, setVideo] = React.useState({
    title: "default",
    file: null,
  });

  const titleInputRef = React.useRef(video.title);

  const videoChangeHandler = (event) => {
    setVideo({
      ...video,
      file: event.target.files[0],
    });
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    const formData = new FormData();
    formData.append('title', video.title);
    formData.append('file', video.file);
    for (const value of formData.values()) {
      console.log(value);
    }
  }

  return (<>
    <div className="container mt-5">
      <h1>New Video</h1>
      <form onSubmit={handleSubmit}>
        <div className="form-group row">
          <label htmlFor="title" className="col-sm-2 col-form-label">Title</label>
          <div className="col-sm-10">
            <input type="text"
                   className="form-control"
                   id="inputEmail3"
                   placeholder="Title"
                   ref={titleInputRef} />
          </div>
        </div>
        <div className="form-group row mt-3">
          <label htmlFor="file-input" className="col-sm-2 col-form-label">File</label>
          <div className="col-sm-10">
            <input type="file" className="form-control-file" id="file-input" onChange={videoChangeHandler} />
          </div>
        </div>
        <button type="submit" className="btn btn-primary mt-4">Submit</button>
      </form>
    </div>
  </>)
};
