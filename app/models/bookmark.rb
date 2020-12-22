class Bookmark < ApplicationRecord
  has_many :tags
  has_many :user, through: :tags
end
