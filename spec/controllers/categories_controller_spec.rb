require "rails_helper"

RSpec.describe CategoriesController, :type => :controller do
  describe 'GET index' do
    before { get :index, format: :json }

    it 'has a 200 status code' do
      expect(response.status).to eq(200)
    end

    it 'returns all categories' do
      expect(controller.instance_variable_get(:@categories)).to eq(Category.all)
      expect(response.media_type).to eq 'application/json'
    end
  end
end
