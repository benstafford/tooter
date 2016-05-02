class TootsController < ApplicationController
  def create
    @toot = current_user.toots.build(toot_parameters)
    if @toot.save
      redirect_to root_path
    else
      redirect_to root_path, alert: @toot.errors
    end
  end

  private

  def toot_parameters
    params.require(:toot).permit(:body)
  end
end
