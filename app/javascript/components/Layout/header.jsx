import * as React from "react";
import { Link } from 'react-router-dom';
export const Header = () => {
  return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light d-flex justify-content-between">
      <Link className="mx-3 navbar-brand" to="/videos">Video Upload App</Link>
      <Link className="btn btn-outline-success mx-4" to="videos/new">Upload</Link>
    </nav>
  );
}
