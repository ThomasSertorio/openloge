class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :update]
  before_action :find_service, only: [:new]
  before_action :find_loge, only: [:new, :update, :show, :create]


  def index
    @bookings_i_made = policy_scope(Booking).where(user: current_user)
    @bookings_i_received = policy_scope(Booking)
        .joins("LEFT OUTER JOIN services ON bookings.service_id = services.id")
        .where("services.user_id = ?", current_user.id)
  end

  def new
    @expert = @service.user
    @booking = Booking.new
      authorize @booking
      @booking.loge = @loge
      @booking.service = @service
      @booking.user = current_user
      @booking.status = "Demande d'information"
      @booking.save
    redirect_to loge_booking_path(@loge, @booking)
  end

  def show
    authorize @booking

    @expert   = @booking.service.user
    @messages = @booking.messages

    @messages.each do |message|
      message.new_message = false
    end

    @new_message = Message.new
    @expert_message = Message.new(user: current_user)
  end


  def create
    @booking = Booking.new(booking_params)
    authorize @booking

    @booking.user = current_user
    @booking.loge = @loge
    @booking.status = "first contact made"

    if @booking.save
      redirect_to loge_booking_path(@loge, @booking)
    else
      # Problem no more service id!
      redirect_to loge_booking_path(@loge, @booking)
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to loge_booking_path(@loge, @booking)
    else
      # Problem no more service id!
      redirect_to loge_booking_path(@loge, @booking)
    end
  end


  private

  def booking_params
    params.require(:booking).permit(
      :description,
      :service_id,
      :starts_at,
      :duration,
      messages_attributes: [:content, :user_id]
    )
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
