class Work < ApplicationRecord
  belongs_to :user
  has_many :language
  has_one_attached :image
end
