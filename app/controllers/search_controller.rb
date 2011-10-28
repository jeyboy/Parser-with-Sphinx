class SearchController < ApplicationController
  def by_topic
    @news = NewsItem.where(:topic_id => params[:id]).paginate(:page => params[:page], :per_page => 15)
    render 'news_items/index'
  end

  def by_request
    @news = (params[:search] ? NewsItem.search(params[:search][:search]) : NewsItem.all).paginate(:page => params[:page], :per_page => 15)
    render 'news_items/index'
  end
end