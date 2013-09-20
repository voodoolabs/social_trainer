class SearchController < ApplicationController
  def index
    @users = User.search(params[:name])
    p @users
    redirect_to users_path
  end
end
