class SearchController < ApplicationController

  def by_topic
    @news = News.where(:topic_id => params[:id]).paginate(:page => params[:page], :per_page => 15)
    render 'news/index'
  end

  def by_request
    @news = (params[:search] ? News.search(params[:search][:search], :page => params[:page], :per_page => 15, :match_mode => :extended2 ) : News.all.paginate(:page => params[:page], :per_page => 15))
    render 'news/index'
  end
end