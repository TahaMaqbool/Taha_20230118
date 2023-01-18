class Video < ApplicationRecord
  belongs_to :category
  has_one_attached :video_clip

  after_create_commit :process_thumbnails


  def to_s
    title
  end

  def video_clip_url
    video_clip.url
  end


  private
  def process_thumbnails
    if video_clip.attached?
      VideoProcessingJob.set(wait_until: 2.minutes.from_now).perform_later(self)
    end
  end
end
