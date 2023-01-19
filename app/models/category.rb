class Category < ApplicationRecord
  belongs_to :video, optional: true
end
