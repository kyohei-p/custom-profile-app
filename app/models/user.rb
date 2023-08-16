class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills

  validates :email, presence: true
  validates :password, presence: true
end
