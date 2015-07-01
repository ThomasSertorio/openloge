class LogesController < ApplicationController

    before_action :find_loge, only:  [:show]

    def index
    @address = params[:user_input_autocomplete_address]
    # session[:address] = addresss
    coordinates = [params[:lat].to_f, params[:lon].to_f]
    # Search a Loge with latitude and longitude
    # The "near" method returns an array of results order from closest to farest, the first gives the Loge closest to the user
    @loge = Loge.near(coordinates, 0.5).first
    if !@loge.nil?
      redirect_to loge_path(@loge)
    end
    @contact = Contact.new

  end

  def show

  end

  private

  def find_loge
    @loge = Loge.find(params[:id])
  end

end
