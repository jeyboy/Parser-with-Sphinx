class NewsItemsController < ApplicationController
  before_filter :init, :only => [:index]
  before_filter :authenticate_user!, :only => [:change_rating]

  def index
  end

  def show
    @news_item = NewsItem.includes(:comments).where(:_id => params[:id]).first
    gem = Rating.where({:user_id => current_user.id.to_s, :news_id => @news_item.id}).first if (user_signed_in?)
    @gem_num = gem ? gem.gems : 1
  end

  def load_last
    Parse.parse_last()
    redirect_to :root
  end

  def load
    Parse.parse_all()
    redirect_to :root
  end

  def change_rating
    rating = Rating.new(params[:rating_attr])
    render :json => {:state => rating.save}
  end

  protected
  def init
    if @curr_topic.blank? || @curr_category.blank?
      @news = NewsItem.all.paginate(:page => params[:page], :per_page => 15)
    else
      redirect_to news_category_topic_path(:category_id => @curr_category, :id => @curr_topic)
    end
  end

end
