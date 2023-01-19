require 'rails_helper'

RSpec.describe Video, :type => :model do
  let(:video) { Video.new(title: 'Test Video', category: Category.first) }

  describe 'Columns' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:category_id).of_type(:integer) }
  end

  describe 'Associations' do
    it { should belong_to(:category) }
    it { should have_one_attached(:video_clip) }
  end

  describe 'Validations' do
    it 'validates supported video file types' do
      video.video_clip.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_mp4_file.mp4')),
                              filename: 'test_mp4_file.mp4', content_type: 'video/mp4')
      expect(video).to be_valid
    end

    it 'does not support other than mp4/mov video file types' do
      video.video_clip.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'other_file_mkv.mkv')),
                              filename: 'other_file_mkv.mkv', content_type: 'video/mkv')
      expect(video).to be_invalid
    end
  end
end
