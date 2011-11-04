class Admins::NewsItemsController < Admins::AdminsController

  def new
    @news_item = NewsItem.new
  end

  def create
    @news_item = NewsItem.new(params[:news_item])
    if @news_item.save
      redirect_to admins_news_items_path, :notice => "News successfully created"
    else
      render :new
    end
  end

  def index
    @news_items = NewsItem.all.paginate(:page => params[:page], :per_page => 15)
  end

  def show
    @news_item = NewsItem.where(:_id => params[:id]).first
  end
end
