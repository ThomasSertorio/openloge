class MessagesController < ApplicationController

   def   create
    @loge = Loge.find(params[:loge_id])
    @booking  =  Booking.find(params[:booking_id])
    @message  =  Message.new(message_params)
      @message.posted_at = Time.now
      @message.user = current_user
      @message.booking  =  @booking
      p @message
    if  @message.save
      p "=====in the if====="
      redirect_to loge_booking_path(@loge, @booking)
     else
      p "=====in the else====="
      render 'restaurants/show'
     end
   end
   private
   def   message_params
    params.require(:message).permit(:content)
   end

 end
