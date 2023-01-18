import * as React from "react";
import { Link } from 'react-router-dom';
export const Header = () => {
  const uploadHandler = () => {
    console.log("uploadHandler");
  }

  return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light d-flex justify-content-between">
      <Link className="mx-3 navbar-brand" to="/videos">Video Upload App</Link>
      <Link className="btn btn-outline-success mx-4" to="/new_video">Upload</Link>
    </nav>
  );
}
