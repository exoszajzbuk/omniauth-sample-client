class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    super# || session[:my_user]
  end

end
