class LikesController < ApplicationController
  def index
    
  end
  
  def create
    val = to_boolean(params[:value])
    like = Like.create!(liker_id: params[:user_id], post_id: params[:post_id], value: val) 
    all_likes =  Post.find(params[:post_id]).likes.count
    {score: all_likes}.to_json
    # redirect_to user_posts_path    
  end

end
