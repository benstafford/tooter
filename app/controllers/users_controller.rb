class UsersController < ApplicationController
  def index
    @toots = Toot.all
  end
end
