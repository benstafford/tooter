class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers 
  end

  def create
    @target_user = User.find(params[:user_id])
    current_user.follow!(@target_user)
    redirect_to user_path(params[:user_id])
  end
  
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    redirect_to user_path(params[:user_id])
  end
end
