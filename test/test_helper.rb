ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest'

class ActiveSupport::TestCase
  include Devise::TestHelpers


end
