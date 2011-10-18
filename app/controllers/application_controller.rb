class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :init_categories, :check_category, :check_topic
  require 'will_paginate/array'

  protected
  def init_categories
    @categories = Category.includes(:topics).all
  end

  def check_topic
    m = request.fullpath.scan(/\/topics\/([^\/]+)/)
    if m.empty?
      @curr_topic = cookies.has_key?('curr_topic') ? cookies['curr_topic'] : "";
    else
      @curr_topic = CGI::unescape(m.last.last)
      cookies['curr_topic'] = @curr_topic
    end
  end

  def check_category
    m = request.fullpath.scan(/\/categories\/([^\/]+)/)
    if m.empty?
      @curr_category = cookies.has_key?('curr_category') ? cookies['curr_category'] : "";
    else
      @curr_category = CGI::unescape(m.last.last)
      cookies['curr_category'] = @curr_category
    end
  end
end
