class PostsController < ApplicationController
  def index
    friend_array_one = current_user.friends
    friend_array_two = current_user.inverse_friends
    friend_array = friend_array_one.pluck(:id) + friend_array_two.pluck(:id)
    @posts = Post.where(user_id: friend_array)
  end

end
