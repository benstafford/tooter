class Api::V1::SessionsController < Api::V1::ApiController
  def create
    authenticate_or_request_with_http_basic do |username, password|
      @user = User.find_by(username: username.downcase)
      if @user && @user.authenticate(password)
        render json: @user, status: 200
      else
        render json: {}, status: 401
      end
    end
  end
end
