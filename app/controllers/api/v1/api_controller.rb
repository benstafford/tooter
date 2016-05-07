class Api::V1::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def default_serializer_options
    {root: false}
  end

  def authenticate_with_token
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(auth_token: token)
    end
  end
end
