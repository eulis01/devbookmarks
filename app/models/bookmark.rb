class Bookmark < ApplicationRecord
  has_many :tags
  has_many :user, through: :tags
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
end
