class User < ApplicationRecord
  has_secure_password
  has_many :tags
  has_many :bookmarks, through: :tags
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
