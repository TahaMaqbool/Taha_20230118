class VideosController < ApplicationController

  def create
  @video = Video.new(video_params)
    if @video.save
      respond_to do |format|
        format.json { render json: video_obj(@video), status: :created }
        format.html
      end
    else
      respond_to do |format|
        format.json { render json: @video.errors, status: :unprocessable_entity }
        format.html
      end
    end
  end
  def index
    @videos = Video.all

    respond_to do |format|
      format.json { render json: formatted_videos }
      format.html
    end
  end

  def new
    @video = Video.new
  end

  private

  def video_params
    params.permit(:title, :thumbnail, :video_clip, :category_id)
  end

  def formatted_videos
    @videos.map { |video| video_obj(video) }
  end

  def video_obj(video)
    {
      id: video.id,
      title: video.title,
      # thumbnails: {
      #   small: video.thumbnail.variant(:small).processed.service_url,
      #   medium: video.thumbnail.variant(:medium).processed.service_url,
      #   large: video.thumbnail.variant(:large).processed.service_url
      # },
      video_clip: video.video_clip_url,
      category: video.category.title
    }
  end
end
