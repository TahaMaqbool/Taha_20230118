class Video < ApplicationRecord
  SUPPORTED_VIDEO_FILE_TYPES = %w[video/mp4 video/mov video/quicktime].freeze

  belongs_to :category
  has_one_attached :video_clip

  after_create_commit :process_thumbnails

  validate :supported_video_file_types
  validate :video_size_limit


  def to_s
    title
  end

  def video_clip_url
    video_clip.url
  end


  private
  def process_thumbnails
    return unless video_clip.attached?

    VideoProcessingJob.set(wait_until: 2.minutes.from_now).perform_later(self)
  end

  def supported_video_file_types
    if video_clip.attached? && !video_clip.content_type.in?(SUPPORTED_VIDEO_FILE_TYPES)
      errors.add(:video_clip, 'Must be a supported video file type')
    end
  end

  def video_size_limit
    if video_clip.attached? && video_clip.byte_size > 200.megabytes
      errors.add(:video_clip, 'Must be less than 200MB')
    end
  end
end
