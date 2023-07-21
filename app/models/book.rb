class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :title, dependent: :destroy
  has_many :body, dependent: :destroy
end
