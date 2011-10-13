class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_categories, :check_category_change

  protected
  def init_categories
    @categories = Topic.all
  end

  def check_category_change
    m = request.fullpath.scan(/\/search\/(\d+)/)
    if m.empty?
      @curr_category = cookies.has_key?('curr_category') ? cookies['curr_category'].to_i : -1;
    else
      @curr_category = m.last.last.to_i
      cookies['curr_category'] = m.last.last
    end
  end
end
