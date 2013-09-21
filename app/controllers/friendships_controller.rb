class FriendshipsController < ApplicationController
  def create
    FriendRequest.find_by(user_id: params[:friendship][:user_id], friend_id: params[:friendship][:friend_id]).destroy
    Friendship.create(user_id: params[:friendship][:user_id], friend_id: params[:friendship][:friend_id])
    redirect_to current_user
  end
end
