class Api::V1::UsersController < Api::V1::ApiController
  before_filter :authenticate_with_token

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer, status: 200
  end
end
