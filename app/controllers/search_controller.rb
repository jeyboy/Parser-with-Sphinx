class SearchController < ApplicationController
  def index
    @news = (params[:search] ? News.search(params[:search][:search], :page => params[:page], :per_page => 15, :match_mode => :extended2 ) : News.all)
    render 'news/index'
  end
end