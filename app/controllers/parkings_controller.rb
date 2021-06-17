class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def parking_bookings
    # raise
    @parking = Parking.find(params[:id])
    @bookings = @parking.bookings
  end

  def index
    @search = params["search"]
    
    if @search.present?
      @address = @search["address"]
      @parkings = Parking.where("address ILIKE ?", "%#{@address}%")
      @available_parkings = []
      if @search[:starts_at].present?
        @parkings_test.each do |parking|
          @available_parkings << parking if parking.is_available?(@search[:starts_at], @search[:ends_at])
          @parkings = @available_parkings
        end
      end
    else
      @parkings = Parking.all
    end
    @markers = @parkings.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude,
        info_window: render_to_string(partial: "info_window", locals: { parking: parking }),
        image_url: helpers.asset_url(view_context.image_path 'parkit')
      }
    end
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
      redirect_to my_parkings_path
    else
      render :new
    end
  end

  def edit
    @parking = Parking.find(params[:id])
    render "parkings/show" unless @parking.user == current_user
  end

  def update
    @parking = Parking.find(params[:id])
    @parking.update(parking_params)
    redirect_to my_parkings_path, notice: "Successfully Updated"
  end

  def destroy
    @parking = Parking.find(params[:id])
    @parking.destroy
    redirect_to my_parkings_path, notice: "Successfully Deleted"
  end

  def pause
    @parking = Parking.find(params[:id])
    @parking.update(available: !@parking.available)
    @parking.bookings.destroy_all
    redirect_to my_parkings_path
  end

  private

  def parking_params
    params.require(:parking).permit(:address, :description, :start_date, :end_date, :from_hour, :to_hour, :available, :title, :photo)
  end
end
