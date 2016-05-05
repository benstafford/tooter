class UsersController < ApplicationController
  def index
    @toots = Toot.all.order("created_at desc")
  end

  def show
    @user = User.find(params[:id])
    @toots = @user.toots.order("created_at desc")
  end
end
