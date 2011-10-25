class SearchController < ApplicationController

  def by_topic
    @news = News.where(:topic_id => params[:id]).paginate(:page => params[:page], :per_page => 15)
    render 'newses/index'
  end

  def by_request
    @news = (params[:search] ? News.search(params[:search][:search]) : News.all).paginate(:page => params[:page], :per_page => 15)
    render 'newses/index'
  end
end