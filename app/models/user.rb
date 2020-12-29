class User < ApplicationRecord
  has_secure_password
  has_many :tags
  has_many :bookmarks, through: :tags
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    find_or_create_by(username: auth[:info][:email]) do |user|
      user.password = SecureRandom.hex(15)
      end
  end
end
