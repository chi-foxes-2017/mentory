class User < ApplicationRecord
  include BCrypt

  has_secure_password

  validates :name, :email, presence: :true
end
