class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]
  before_action :find_service, only: [:new]
  before_action :find_loge, only: [:show, :create]

  def show
    @expert = @booking.service.user
    @messages = @booking.messages
    @messages.each do |message|
      message.new_message = false
    end
    @new_message = Message.new
    @new_booking = Booking.new
  end

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
      message = Message.new
        message.booking = @booking
        message.user = current_user
        message.posted_at = Time.now
        message.content = @booking.description
        message.new_message = true
        message.save
      redirect_to loge_booking_path(@loge, @booking)
    else
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

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_loge
    @loge = Loge.find(params[:loge_id])
  end

end
