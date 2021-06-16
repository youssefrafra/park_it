class BookingsController < ApplicationController
  def new
    @parking = Parking.find(params[:parking_id])
    if(@parking.user != current_user)
      @booking = Booking.new
    else
      render "parkings/show"
    end
  end

  def create
    @user = current_user
    @parking = Parking.find(params[:parking_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.parking = @parking
    if @booking.save!
      redirect_to parking_path(@parking)
    else
      render 'parkings/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status:"accepted")
    redirect_to parking_bookings_parking_path(@booking.parking) 
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status:"refused")
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :from_hour, :to_hour)
  end
end
