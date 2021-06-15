class BookingsController < ApplicationController
  def new
    raise
    # @user = current_user
    # @booking = Booking.new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def accept
  end

  def decline
  end

  private

  def booking_params
    params.require(:booking).permit[:status, :start_date, :end_date, :from_hour, :to_hour]
  end
end
