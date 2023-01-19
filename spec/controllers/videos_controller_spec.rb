require "rails_helper"

RSpec.describe VideosController, :type => :controller do
  describe 'GET index' do
    before { get :index, format: :json }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'returns all videos' do
      expect(controller.instance_variable_get(:@videos)).to eq(Video.all)
      expect(response.media_type).to eq 'application/json'
    end
  end
end
