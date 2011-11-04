class Admins::AdminsController < ActionController::Base
  protect_from_forgery
  layout 'application'

  require 'will_paginate/array'

  before_filter :authenticate_admin!
end
