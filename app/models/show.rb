class Show < ApplicationRecord
  belongs_to :movie
  has_many :seats, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
