class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true

  has_one_attached :picture

  attribute :new_picture

  before_save do
    if new_picture
      self.picture = new_picture
    end
  end

  has_one_attached :picture_dall

  attribute :new_picture_dall

  before_save do
    if new_picture_dall
      self.picture_dall = new_picture_dall
    end
  end
end
