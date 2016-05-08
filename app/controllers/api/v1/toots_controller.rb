class Api::V1::TootsController < Api::V1::ApiController
  before_filter :authenticate_with_token

  def index
    @toots = @user.feed
    render json: @toots, each_serializer: TootSerializer, status: 200
  end
end
