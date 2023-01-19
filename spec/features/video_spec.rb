describe 'video specs', type: :feature do
  before { visit root_path }

  it 'display videos on home page' do
    expect(page).to have_content('All Videos')
    expect(page).to have_content('There are no videos at this time. Please upload video using upload button')
    expect(page).to have_link('Upload')
  end

  describe 'upload video specs' do
    before { click_link 'Upload' }

    it 'visits upload video page and see form' do
      expect(page).to have_content('New Video')
      expect(page).to have_css('input[type="file"]')
      expect(page).to have_content('Title')
      expect(page).to have_content('File')
      expect(page).to have_content('Category')
    end

    it 'validates video file type' do
      attach_file('File', Rails.root + 'spec/fixtures/files/other_file_mkv.mkv')
      click_button 'Submit'
      expect(page).to have_content('Please upload a valid video file (mp4, mov)')
    end

    it 'uploads video and redirected to videos page and display videos' do
      fill_in 'Title', with: 'Test Video Title'
      attach_file('File', Rails.root + 'spec/fixtures/files/test_mp4_file.mp4')
      select 'Education', from: 'Category'
      click_button 'Submit'
      expect(page).to have_text('Submitting Please wait...')
      expect(page).to have_button('Submit', disabled: true)
      expect(page).to have_content('All Videos', wait: 20)
      expect(page).to have_content('Test Video Title')
      expect(page).to have_content('Education')
      expect(page).to have_css('video[title="Test Video Title"]')
      find('video').click
    end
  end
end
