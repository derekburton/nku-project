class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 1 }, allow_nil: true
  has_many :reviews
end