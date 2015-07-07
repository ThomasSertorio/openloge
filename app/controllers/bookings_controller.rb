class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]
  before_action :find_service, only: [:new]
  before_action :find_loge, only: [:show, :create]


  def index
    @bookings_i_made = policy_scope(Booking).where(user: current_user)
    @bookings_i_received = policy_scope(Booking)
        .joins("LEFT OUTER JOIN services ON bookings.service_id = services.id")
        .where("services.user_id = ?", current_user.id)
  end

  def show
    authorize @booking
    @expert = @booking.service.user
    @messages = @booking.messages
    @messages.each do |message|
      message.new_message = false
    end
    @new_message = Message.new
    @new_booking = Booking.new
  end

  def new
    @expert = @service.user
    @booking = Booking.new
    authorize @booking
    @booking.service = @service
  end

  def create
    @booking = Booking.new(booking_params)
      authorize @booking
      @booking.user = current_user
      @booking.loge = @loge
      @booking.status = "first contact made"
      @booking.save
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
    authorize @booking
  end

  def find_loge
    @loge = Loge.find(params[:loge_id])
  end

end
