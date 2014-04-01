class UsersController < ApplicationController
  
  def deauthorize
    user = User.where(doorkeeper_uid: params[:remote_user_id]).first

    if user
      user.reauthorization_needed = true
      user.save

      render json: user
    else
      render text: 'no remote_user_id given'
    end
  end

end
