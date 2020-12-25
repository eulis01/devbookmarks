class Tag < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true, uniqueness: true
  
end
