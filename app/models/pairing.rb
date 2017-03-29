class Pairing < ApplicationRecord
  belongs_to :mentor
  belongs_to :mentee

  validates_presence_of :mentor_id, :start_time
  validates :start_time, :between => ['6:00pm', '8:30am']

end
