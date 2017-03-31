class User < ApplicationRecord
  include BCrypt
  has_many :offerings, class_name: "Pairing", foreign_key: "mentor_id"
  has_many :menteeships, class_name: "Pairing", foreign_key: "mentee_id"
  has_secure_password

  validates :name, :email, presence: :true

  def current_offerings
    offerings.select { |off| off.start_time > Time.now }
  end

  def past_offerings
    offerings.select { |off| off.start_time < Time.now }
  end

end
