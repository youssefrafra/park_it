class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @parkings = Parking.all
  end

  def show
    @parking = Parking.find(params[:id])
  end

  def new
    @user = current_user
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user = current_user

    if @parking.save!
      redirect_to parking_path(@parking)
    else
      render :new
    end
  end

  def edit
    @parking = Parking.find(params[:id])
  end

  def update
    @parking = Parking.find(params[:id])
    @parking.update(parking_params)
  end

  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy
    redirect_to parkings_path
  end

  def pause
    @parking = Parking.find(params[:id])
    @parking.pause = !@parking.pause
  end

  private

  def parking_params
    params.require(:parking).permit(:address, :description, :start_date, :end_date, :from_hour, :to_hour, :available)
  end
end
