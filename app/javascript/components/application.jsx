import React from "react";
import { createRoot } from 'react-dom/client';
import { Header } from "./Layout/header";
import { VideoClips } from "./Videos/VideoClips";
import { NewVideo } from "./Videos/NewVideo";
import { BrowserRouter, Routes, Route } from 'react-router-dom';
const App = () => {
  return (<>
    <BrowserRouter>
      <Header />
      <Routes>
        <Route path="new_video" element={<NewVideo />} />
        <Route path="videos" element={<VideoClips />} />
      </Routes>
    </BrowserRouter>
  </>)
};

document.addEventListener("DOMContentLoaded", () => {
  const root = createRoot(document.getElementById("root"));
  root.render(<App/>);
});
