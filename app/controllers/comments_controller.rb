class CommentsController < ApplicationController
  def index
    # @comment = Comment.new
  end

  def new
    # @comment = Comment.new
  end

  def create
    Comment.create!(content: params[:comment][:content], user_id: current_user.id, post_id: params[:post_id])
    redirect_to user_posts_path 
  end
end
