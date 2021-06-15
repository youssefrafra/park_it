class ProfilesController < ApplicationController
  def parkings
    @user = current_user
    @parkings = Parking.where(user: @user)
  end

  def bookings
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

end
