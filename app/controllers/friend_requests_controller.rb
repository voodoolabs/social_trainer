class FriendRequestsController < ApplicationController

  def create
    FriendRequest.create(user_params)
    redirect_to users_path
  end

  def user_params
    params.require(:friend_request).permit(:user_id, :friend_id)
  end
end
