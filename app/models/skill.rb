class Skill < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :skill_level, presence: true
end
