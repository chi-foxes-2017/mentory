class User < ApplicationRecord
  include BCrypt
  has_many :offerings, class_name: "Pairing", foreign_key: "mentor_id"
  # has_many :pairings, foreign_key: "mentee_id"
  has_secure_password

  validates :name, :email, presence: :true
end
