class Booking < ApplicationRecord
  belongs_to :student
  belongs_to :hostel
end
