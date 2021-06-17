class Parking < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :from_hour, presence: true
  validates :to_hour, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def is_available?(start_date, end_date)
    range_user = Date.parse(start_date)..Date.parse(end_date)
    self.bookings.each do |booking|
      range_booking = booking.start_date..booking.end_date
      return false if range_user.overlaps?(range_booking)
    end
    return true
  end
end
