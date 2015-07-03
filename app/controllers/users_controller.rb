class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_user, only:  [:show]
  before_action :find_loge, only:  [:show]

  def show
    @expert = @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def find_loge
    @loge = Loge.find(params[:loge_id])
  end



end
