  class ApplicationController < ActionController::Base
  # include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :pages_controller?

  helper_method :current_loge
  # after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_loge
    return unless current_user
    @current_loge ||= current_user.find_principal_loge
  end

  private

  def after_sign_in_path_for(resource)
    #def after_sign_in_path_for(resource)
    #loge = resource.memberships.first.loge
    #loge_path(loge)
    if resource.find_principal_loge.nil?
      home_path
    else
      loge_path(resource.find_principal_loge)
    end
  end

  def devise_or_pages_controller?
    devise_controller? || pages_controller?
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

end
