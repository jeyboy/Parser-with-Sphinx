Given /^I have news_item with title (.+) and body (.+)$/ do |title, body|
  NewsItem.create!({:title => title, :body => body})
end