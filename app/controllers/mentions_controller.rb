class MentionsController < ApplicationController
  def index
    @mentions = Mention.includes(:toot).where(user_id: params[:user_id])
  end
end
