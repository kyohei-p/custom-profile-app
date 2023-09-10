class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills
  has_one_attached :image

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, if: -> { password.present? }
  validates :self_introduction, presence: true, length: { minimum: 50, maximum: 200 }
end
