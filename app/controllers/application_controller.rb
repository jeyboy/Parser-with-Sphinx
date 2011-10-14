class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_categories, :check_category, :check_topic

  protected
  def init_categories
    @categories = Category.includes(:topics).all
  end

  def check_topic
    m = request.fullpath.scan(/\/topics\/(\d+)/)
    if m.empty?
      @curr_topic = cookies.has_key?('curr_topic') ? cookies['curr_topic'].to_i : -1;
    else
      @curr_topic = m.last.last.to_i
      cookies['curr_topic'] = m.last.last
    end
  end

  def check_category
    m = request.fullpath.scan(/\/categories\/(\d+)/)
    if m.empty?
      @curr_category = cookies.has_key?('curr_category') ? cookies['curr_category'].to_i : -1;
    else
      @curr_category = m.last.last.to_i
      cookies['curr_category'] = m.last.last
    end
  end
end
