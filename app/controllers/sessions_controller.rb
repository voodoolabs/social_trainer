class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    @user = user.authenticate(params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to posts_path
    end
  end

  def destroy
    session.clear
    redirect_to posts_path
  end

end
