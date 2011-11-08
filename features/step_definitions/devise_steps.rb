Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |user_name, email, password|
  User.new(:user_name => user_name,
           :email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  user_name = "jebodan"
  email = 'testing@man.net'
  password = 'secretpass'

  step %{I have one user "#{user_name}" with email "#{email}" and password "#{password}"}
  step %{I go to user_login}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I press "Sign in"}
end

Given /^I have one\s+admin "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  Admin.new(:email => email,
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated admin$/ do
  email = 'testing@admin.net'
  password = 'secretpass'

  step %{I have one admin "#{email}" with password "#{password}"}
  step %{I go to admin_login}
  step %{I fill in "admin_email" with "#{email}"}
  step %{I fill in "admin_password" with "#{password}"}
  step %{I press "Sign in"}
end