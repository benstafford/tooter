class Api::V1::TootsController < Api::V1::ApiController
  before_filter :authenticate_with_token

  def index

    render json: {}, status: 200
  end
end
