class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      # HACK to pass to the user his/her loge
      add_address_to_user(resource)
      add_user_to_loge(resource)

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    if resource.find_principal_loge.nil?
      home_path
    else
      loge_path(resource.find_principal_loge)
    end
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    if resource.find_principal_loge.nil?
      home_path
    else
      loge_path(resource.find_principal_loge)
    end
  end

  private

  def add_user_to_loge(resource)
    member = resource.memberships.new
    member.loge = Loge.find(session[:loge_id])
    member.member_since = DateTime.now.to_date
    member.save

    session[:loge_id] = nil
  end

  def add_address_to_user(resource)
    resource.address = session[:address]
    resource.save
    session[:address] = nil
  end

end
