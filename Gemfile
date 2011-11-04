source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'mongrel', '> 1.beta'

gem 'twitter'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

######### Mongo
gem 'mongo', :git => 'git://github.com/mongodb/mongo-ruby-driver.git'
gem "mongoid"
gem 'riddle'
gem 'bson'
gem 'bson_ext'
gem 'mongoid-sphinx',:require => 'mongoid_sphinx', :git => 'git@github.com:jeyboy/mongoid-sphinx.git'
#########

gem 'devise'

gem 'curb'
gem 'nokogiri'
#gem 'pg'
gem 'therubyracer'
gem 'will_paginate', '~> 3.0.pre4'

gem 'thinking-sphinx', :git => 'git://github.com/freelancing-god/thinking-sphinx.git', :branch  => 'rails3'

gem 'whenever', :require => false
gem 'haml-rails'

gem 'web-app-theme', '~> 0.8.0'
gem 'hpricot'
gem 'ruby_parser'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  gem 'rspec-rails'
  gem 'mongoid-rspec'
end

group :test do
  gem 'minitest'
  # Pretty printed test output
  #gem 'turn', :require => false
  #gem 'shoulda'
  gem "cucumber-rails", ">= 1.0.2"
  #gem 'mongoid-cucumber'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'webrat'
end
