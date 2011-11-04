class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'user_application'


  before_filter :init_categories, :check_category, :check_topic, :curr_page
  require 'will_paginate/array'

  protected
  def init_categories
    @categories = Category.includes(:topics).all
  end

  def check_obj(obj_pattern, obj_name)
    m = request.fullpath.scan(/\/#{obj_pattern}\/([^\/]+)/)
    if m.empty?
      cookies[obj_name] || ""
    else
      cookies['curr_page'] = '1'
      cookies[obj_name] = CGI::unescape(m.last.last)
    end
  end

  def curr_page
    cookies['curr_page'] = @curr_page = params[:page] || cookies['curr_page'] || '1'
  end

  def check_topic
    @curr_topic = check_obj('topics', 'curr_topic')
  end

  def check_category
    @curr_category = check_obj('categories', 'curr_category')
  end
end
