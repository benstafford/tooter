class Api::V1::ApiController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def default_serializer_options
    {root: false}
  end
end
