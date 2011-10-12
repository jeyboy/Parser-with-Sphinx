class SearchController < ApplicationController
  require 'will_paginate/array'

  def index
    @news = (params[:search] ? News.search(params[:search][:search], :page => params[:page], :per_page => 15, :match_mode => :extended2 ) : News.all.paginate(:page => params[:page], :per_page => 15))
    render 'news/index'
  end

  def by_topic
    @news = News.find_all_by_topic_id(params[:topic]).paginate(:page => params[:page], :per_page => 15)
    render 'news/index'
  end
end