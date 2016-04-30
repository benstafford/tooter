class TootsController < ApplicationController
  def index
    @toots = Toot.all
  end
end
