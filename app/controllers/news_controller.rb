class NewsController < ApplicationController
  before_filter :init, :only => [:index]

  def index
  end

  def show
    @news_item = News.find_by_id(params[:id])
  end

  def load
    Parse.parse_link('habrahabr.ru/')
    redirect_to :root
  end

  protected
  def init
    @news = News.order('created_at ASC').paginate(:page => params[:page], :per_page => 15)
  end

end
