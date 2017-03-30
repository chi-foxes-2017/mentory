class User < ApplicationRecord
  include BCrypt
  has_many :offerings, class_name: "Pairing", foreign_key: "mentor_id"
  has_many :menteeships, class_name: "Pairing", foreign_key: "mentee_id"
  has_secure_password

  validates :name, :email, presence: :true

  before_save :default_values

  def current_offerings
    offerings.select { |off| off.start_time > Time.now }
  end

  def past_offerings
    offerings.select { |off| off.start_time < Time.now }
  end

  protected

  def default_values
    if self.url.length == 0
      self.url = "https://ewedit.files.wordpress.com/2016/12/baby-groot.jpg?w=612"
    end
  end

end
