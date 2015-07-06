class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])

    if user.persisted?
      p "==== fb connect worked ====="
      if user.find_principal_loge.nil?
        p "==== User is not member of a Loge yet ====="
        if session[:loge_id].nil?
          p "==== He hasn't visited any Loge yet ====="
          sign_in_and_redirect user, event: :authentication
          set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        else
          p "==== We suscribe him to the Loge he visited ====="
          # Add address to user
          user.address = session[:address]
          user.save
          # Create user memberships
          member = user.memberships.new
          member.loge = Loge.find(session[:loge_id])
          member.member_since = DateTime.now.to_date
          member.save
          sign_in_and_redirect user, event: :authentication
          set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
        end
      end

    else
      p "==== fb connect didn't work ====="
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url

    end
  end
end
