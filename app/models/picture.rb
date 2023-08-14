class Picture < ApplicationRecord
  has_one_attached :painting_taste_picture
  attribute :painting_taste_new_picture
end
