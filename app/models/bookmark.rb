class Bookmark < ApplicationRecord
  has_many :tags
  has_many :user, through: :tags
  validates :name, presece: true, uniqueness: true
  validates :url, presece: true, uniqueness: true
end
