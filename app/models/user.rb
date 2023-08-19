class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills
  has_one_attached :image

  validates :email, presence: true
  validates :password, presence: true, if: -> { password.present? }
  validates :self_introduction, presence: true, length: { minimum: 50, maximum: 200 }
end
