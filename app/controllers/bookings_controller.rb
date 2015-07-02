class BookingsController < ApplicationController
  before_action :find_service, only: [:new]
  before_action :find_loge, only: [:create]

  def new
    p @expert = @service.user
    p @booking = Booking.new
    p @booking.service = @service
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.loge = @loge
    @booking.status ="first contact made"
    if @booking.save
      p "in the if"
      redirect_to loge_path(@loge)
    else
      p "in the else"
      # Problem no more service id!
      render :new
    end
  end

  def update
  end


  private

  def booking_params
    params.require(:booking).permit(:description, :service_id)
  end

  def find_service
    @service = Service.find(params[:service_id])
  end

  def find_loge
    @loge = Loge.find(params[:loge_id])
  end

end
