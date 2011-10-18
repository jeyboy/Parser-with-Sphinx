class TwitController < ApplicationController
  def index
    @twits = Twitter.home_timeline({:count => 50})
  end

  def new
  end

  def create
    Twitter.update(params[:twit])
  end

end
