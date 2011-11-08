Given /^I have news_item with title "([^"]*)" and body "(.+)"$/ do |title, body|
  NewsItem.create!({:title => title, :body => body})
end

Given /^I have empty list of (.+)$/ do |class_name|
  (class_name.classify.constantize).destroy_all
end

When /^I have category with title "([^"]*)" with topics:$/ do |cat_title, fields|
  c = Category.create!({:title => cat_title})
  fields.cell_matrix.each do |title|
    Topic.create!({:title => title.first.value, :category_id => c.id})
  end
end

When /^I have topic with title "([^"]*)" witch contain news:$/ do |topic, fields|
  t = Topic.where(:title => topic).first
  fields.rows_hash.each do |name, value|
    NewsItem.create!({:title => name, :body => value, :topic_id => t._id})
  end
end

Then /^I should have (\d+) (.+)$/ do |num, class_name|
  (class_name.classify.constantize).count == num.to_i
end

When /^I wait for (\d+) seconds$/ do |secs|
  sleep secs.to_i
end

Then /^"([^"]*)" should have class "([^"]*)"$/ do |id, obj_class|
  assert page.has_css?('#'+id+'.'+obj_class)
end




