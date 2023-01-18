class VideoProcessingJob < ApplicationJob
  queue_as :default

  def perform(video)
    #    video.video_clip.preview(resize_to_limit: [64, 64]).processed
    video.video_clip.representation(resize_to_limit: [64, 64]).processed.url
    video.video_clip.representation(resize_to_limit: [128, 128]).processed.url
    video.video_clip.representation(resize_to_limit: [256, 256]).processed.url
  end
end
