class MessagesController < ApplicationController

   def   create
    @loge = Loge.find(params[:loge_id])
    @booking  =  Booking.find(params[:booking_id])
    @message  =  Message.new(message_params)
      authorize @message
      @message.posted_at = Time.now
      @message.user = current_user
      @message.booking  =  @booking
    if  @message.save
      @booking.messages.each do |message|
        message.new_message = false if message != @message
      end
      redirect_to loge_booking_path(@loge, @booking)
    else
      redirect_to loge_booking_path(@loge, @booking)
     end
   end

   private
   def   message_params
    params.require(:message).permit(:content)
   end

 end
