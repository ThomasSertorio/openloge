class LogesController < ApplicationController
    skip_before_action :authenticate_user!
    before_action :find_loge, only:  [:show]

    def index
    @address = params[:user_input_autocomplete_address]
    session[:address] = @address
    coordinates = [params[:lat].to_f, params[:lon].to_f]
    # Search a Loge with latitude and longitude
    # The "near" method returns an array of results order from closest to farest, the first gives the Loge closest to the user
    @loge = policy_scope(Loge).near(coordinates, 1).first
    if !@loge.nil?
      redirect_to loge_path(@loge)
    else
      # Actually I should save the user and then edit it in the view if he/she wants to het the news:)
      @contact = Contact.new
    end
  end

  def show
    # Put in session the last Loge seen
    session[:loge_id] = @loge.id
    authorize @loge
  end

  private

  def find_loge
    @loge = Loge.find(params[:id])
    authorize @loge
  end

end
