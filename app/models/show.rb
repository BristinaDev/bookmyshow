class Show < ApplicationRecord
  belongs_to :movie
  has_many :seats
end
