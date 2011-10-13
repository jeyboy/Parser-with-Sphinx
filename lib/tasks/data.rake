namespace :data do
  require 'parse'

  desc 'parse all topics'
  task :parse => :environment do
    Parse.parse_all()
  end

  desc 'parse last topics'
  task :parse_last => :environment do
    Parse.parse_last()
  end
end
