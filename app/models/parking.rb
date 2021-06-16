class Parking < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :from_hour, presence: true
  validates :to_hour, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
