class FavoritesController < ApplicationController

  def create
    @toot = Toot.find(params[:toot_id])
    @toot.favorites.create(user: current_user)
    redirect_to root_path
  end

  private

  def favorites_params
    params.permit(:toot_id)
  end
end
