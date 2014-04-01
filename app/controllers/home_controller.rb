class HomeController < ApplicationController
  
  before_filter :authorize!

  def index
  end

  def blabla
  end

  private

  def authorize!
    unless user_signed_in?
      session[:container_id] = '12345'
      redirect_to user_omniauth_authorize_path(:doorkeeper)
    end
  end

end
