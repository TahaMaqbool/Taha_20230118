import React, { useState, useEffect } from "react";
import { useNavigate } from 'react-router-dom';
export const NewVideo = () => {

  const [video, setVideo] = React.useState({
    title: "default video title",
    video_clip: null,
  });

  const [categories, setCategories] = React.useState([]);
  const [selectedCategory, setSelectedCategory] = React.useState('');
  const [loading, setLoading] = useState(false);

  const titleInputRef = React.useRef(video.title);
  const navigate = useNavigate();

  useEffect(() => {
    const url = "/categories";
    fetch(url)
      .then((res) => {
        if (res.ok) {
          return res.json();
        }
        throw new Error("Server Error");
      })
      .then((res) =>  setCategories(res))
      .catch((error) => console.log(error.message));
  }, []);

  const videoChangeHandler = (event) => {
    setVideo({
      ...video,
      video_clip: event.target.files[0],
    });
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    setLoading(true);
    const token = document.querySelector('[name=csrf-token]').content
    const formData = new FormData();
    formData.append('title', titleInputRef.current.value);
    formData.append('video_clip', video.video_clip);
    formData.append('category_id', selectedCategory);

    const requestOptions = {
      method: 'POST',
      headers: {
        'X-CSRF-Token': token,
      },
      body: formData,
    }
    delete requestOptions.headers['Content-Type'];
    fetch('/videos', requestOptions).catch(error =>  {
      console.log(error)
      setLoading(false)}
    ).then(response => {
      setLoading(false);
      if (response.ok) {
        navigate('/videos');
      }
    });
  };

  return (<>
    <div className="container mt-5">
      <h1 className="mb-5">New Video</h1>
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
            <input type="file" className="form-control-file" id="file-input" onChange={videoChangeHandler} disabled={loading} />
          </div>
        </div>
        <div className="form-group row">
          <label htmlFor="title" className="col-sm-2 col-form-label">Category</label>
          <div className="col-sm-10">
            <select className="form-select" aria-label="category select"
                    onChange={e => setSelectedCategory(e.target.value)}>
              <option selected disabled>-- Please select one category --</option>
              { categories.map(category => (<option key={category.id} value={category.id}>{category.title}</option>))}
            </select>
          </div>
        </div>
          <button type="submit" className="btn btn-primary mt-4" disabled={loading}>Submit</button>
          <button type="button" className="btn btn-secondary mt-4 mx-3" onClick={() => navigate(-1)} disabled={loading}>Back</button>
      </form>
      { loading && <div>
        <span>Submitting Please wait...</span>
        <div className="spinner-border mt-4 mx-4" role="status">
          <span className="sr-only"></span>
        </div>
      </div> }
    </div>
  </>)
};
