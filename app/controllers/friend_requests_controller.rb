class FriendRequestsController < ApplicationController

  def create
    FriendRequest.create(user_params)
    redirect_to users_path
  end

  def destroy
    FriendRequest.find_by(user_id: params[:friendship][:user_id], friend_id: params[:friendship][:friend_id]).destroy
    redirect_to current_user
  end

  private

  def user_params
    params.require(:friend_request).permit(:user_id, :friend_id)
  end
end
