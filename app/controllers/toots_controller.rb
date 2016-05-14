class TootsController < ApplicationController
  def create
    @toot = CreateTootUseCase.run(current_user, toot_parameters)
    if @toot.save
      redirect_to user_path(current_user)
    else
      redirect_to root_path, alert: @toot.errors
    end
  end

  private

  def toot_parameters
    params.require(:toot).permit(:body)
  end
end
