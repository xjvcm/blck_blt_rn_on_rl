class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true

  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8 }
end
