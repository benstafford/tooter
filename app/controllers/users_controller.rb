class UsersController < ApplicationController
  def index
    if current_user
      @toots = current_user.feed 
    else
      @toots = Toot.all.order("created_at desc")
    end
  end

  def show
    @user = User.find(params[:id])
    @toots = @user.toots.order("created_at desc")
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
