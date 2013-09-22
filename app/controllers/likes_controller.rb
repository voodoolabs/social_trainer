class LikesController < ApplicationController
  def index
    
  end
  
  def create
    p "X"*100
    p params
    p params[:user_id]
    p params[:post_id]
    p "X"*100
    val = to_boolean(params[:value])
    like = Like.create!(liker_id: params[:user_id], post_id: params[:post_id], value: val) 
    all_likes =  Post.find(params[:post_id]).likes.count
    {score: all_likes}.to_json
    # redirect_to user_posts_path    
  end

end
