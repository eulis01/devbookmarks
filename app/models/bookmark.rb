class Bookmark < ApplicationRecord
  has_many :tags
  has_many :user, through: :tags
  validate :name, presece: true, uniqueness: true
  validate :url, presece: true, uniqueness: true
end
