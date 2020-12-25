class Tag < ApplicationRecord
  belongs_to :bookmark
  belongs_to :user
  validate :name, presece: true, uniqueness: true
  validate :color, presece: true, uniqueness: true
  
end
