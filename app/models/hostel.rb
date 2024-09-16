class Hostel < ApplicationRecord
  belongs_to :landlord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :images
end
