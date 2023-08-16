class Skill < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
end
