class Tag < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user
  validates :name, presece: true, uniqueness: true
  validates :color, presece: true, uniqueness: true
  
end
