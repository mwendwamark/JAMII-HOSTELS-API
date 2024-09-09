class Review < ApplicationRecord
  belongs_to :hostel
  belongs_to :student
end
