namespace :data do
  desc 'add new admin with default login and password'
  task :generate_items => :environment do
    1000000.times do |index|
	Post.new({:title => index.to_s, :body => ["ruby", "rails", 'php'][index % 3]+Random.srand.to_s}).save
    end
  end
end
