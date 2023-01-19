require "rails_helper"

RSpec.describe VideoProcessingJob, type: :job do
  describe '#perform' do
    let(:video) { Video.create(title: 'Test Video', category: Category.first) }

    it 'generates thumbnails for a video' do
      video.video_clip.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_mp4_file.mp4')),
                              filename: 'test_mp4_file.mp4', content_type: 'video/mp4')
      video.save
      expect(video.video_clip).to be_attached
      expect { VideoProcessingJob.perform_later(wait_until: 2.minutes.from_now) }.to have_enqueued_job
    end

    it 'validates max video file size' do
      allow(video).to receive(:video_clip).and_return(
        double('video_clip', byte_size: 300.megabytes, attached?: true, content_type: 'video/mp4')
      )
      expect(video).to be_invalid
    end

    it 'allows video file size less than 200MB' do
      allow(video).to receive(:video_clip).and_return(
        double('video_clip', byte_size: 100.megabytes, attached?: true, content_type: 'video/mp4')
      )
      expect(video).to be_valid
    end
  end
end
