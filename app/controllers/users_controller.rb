class UsersController < ApplicationController
  def index
    @toots = Toot.all_ordered
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @toots = @user.feed
    else
      @toots = Toot.only_for(@user) 
    end
  end

  def new
  end

  def create
    @user = User.new(user_parameters)
    if @user.save
      sign_in(@user)
      redirect_to root_path
    else
      render "new", alert: @user.errors
    end
  end

  private

  def user_parameters
    params.require(:user).permit(:first_name, :username, :password, :password_confirmation)
  end
end
