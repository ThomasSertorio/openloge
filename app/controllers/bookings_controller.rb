class BookingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_service, only: [:new, :create, :update]
  before_action :find_loge, only: [:new, :create, :update]

  def new
    @booking = Booking.new
    @booking.service = @service
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @boooking.service = @service
    @booking.loge = @loge
    if @booking.save
      @booking.update(status: "validated")
      redirect_to user_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to user_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :description, :duration, :pricing_nature)
  end

  def find_service
    @service = Service.find(params[:service_id])
  end

  def find_loge
    @loge = Loge.find(params[:loge_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
