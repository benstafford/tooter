class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers 
  end

  def create
    Follow.create(follower_id: current_user.id, followed_id: params[:user_id])
    redirect_to user_path(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    redirect_to user_path(params[:user_id])
  end
end
