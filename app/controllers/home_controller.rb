class HomeController < ApplicationController
  
  before_filter :authorize!

  def index
  end

  def blabla
  end

  private

  def authorize!
    if !user_signed_in? || (user_signed_in? && current_user.reauthorization_needed?)
      session[:container_id] = '12345'
      redirect_to user_omniauth_authorize_path(:doorkeeper)
    end
  end

end
