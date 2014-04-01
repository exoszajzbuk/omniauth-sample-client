class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def failure
    session.delete(:container_id)
  end

  def doorkeeper
    container_id = session[:container_id]
    session.delete(:container_id)

    oauth_data = request.env["omniauth.auth"]

    @user = User.find_or_create_for_doorkeeper_oauth(oauth_data)
    @user.update_doorkeeper_credentials(oauth_data)
    @user.reauthorization_needed = false
    @user.save

    sign_in_and_redirect @user
  end

end
