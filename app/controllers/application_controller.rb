class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_categories

  protected
  def init_categories
    @categories = Topic.all
  end
end
