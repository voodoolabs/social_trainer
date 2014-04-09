class PostsController < ApplicationController
  def index
    if current_user
      friend_array_one = current_user.friends
      friend_array_two = current_user.inverse_friends
      friend_array = friend_array_one.pluck(:id) + friend_array_two.pluck(:id)
      friend_array << current_user.id
      posts = Post.where(user_id: friend_array)
      @posts = posts.order("created_at DESC")
    else
      redirect_to root_url
    end
  end

  def new

  end
  def update
    100.times do
      puts "======="
    end
    puts params
    # puts 100*"======="
    @post = Post.find(params[:id])
    puts @post
  end

  def create
    new_post = Post.create(title: params[:post][:title], text_field: params[:post][:text_field], user_id: current_user.id)
    redirect_to user_posts_path
  end
end
