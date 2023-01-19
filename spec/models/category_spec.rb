require 'rails_helper'

RSpec.describe Category, :type => :model do
  VALID_CATEGORIES = %w[Exercise Education Recipe]

  describe 'has seed categories populated in database' do
    it 'has some categories' do
      expect(Category.count).to eq(VALID_CATEGORIES.count)
    end

    it 'has the correct categories' do
      expect(Category.pluck(:title)).to match_array(VALID_CATEGORIES)
    end
  end
end
