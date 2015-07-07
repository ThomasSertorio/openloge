class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_user, only:  [:show, :edit, :update]
  before_action :find_loge, only:  [:show, :edit, :update]

  def show
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    if @user.update(user_params)
      redirect_to loge_user_path(@loge, @user)
    else
      render :edit
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to loge_user_path(@loge, @user)
  end

  private

  def find_user
    @user = User.find(params[:id])
    authorize @user
  end

  def find_loge
    @loge = Loge.find(params[:loge_id])
  end

  def user_params
    params.require(:user).permit(:picture, :picture_facebook, :first_name)
  end
end
