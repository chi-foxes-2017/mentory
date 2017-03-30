class Pairing < ApplicationRecord
  belongs_to :mentor, :class_name => "User", :foreign_key => "mentor_id"
  # if :mentee_id
  #   belongs_to :mentee, :class_name => "User", :foreign_key => "mentee_id"
  # end

  validates_presence_of :mentor_id, :start_time
  validate :start_time_outside_core_hours

  def start_time_outside_core_hours
    ((self.start_time.hour >= 18) || (self.start_time.hour <= 8)) && ((self.start_time.min == 30) || (self.start_time.min == 0))
  end

end
