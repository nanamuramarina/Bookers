class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  validatesra :title, presence: true
  validate :body, length:{maxmum:50}
end
