class Api::V1::TootsController < Api::V1::ApiController
  before_filter :authenticate_with_token

  def index
    @toots = @user.feed
    render json: @toots, each_serializer: TootSerializer, status: 200
  end

  def create
    @toot = @user.toots.build(toot_params)
    if @toot.save
      render json: @toot, status: 200
    else
      render json: @toot.errors, status: :unprocessable_entity
    end
  end

  private

  def toot_params
    params.require(:toot).permit(:body)
  end
end
