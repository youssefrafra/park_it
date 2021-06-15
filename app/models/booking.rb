class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :from_hour, presence: true
  validates :to_hour, presence: true
end
