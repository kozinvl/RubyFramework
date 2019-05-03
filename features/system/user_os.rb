When(/^I go to "([^"]*)"$/) do |directory|
  pending
end

And(/^I create "([^"]*)" with name "([^"]*)"$/) do |object, name|
  pending
end

And(/^I put "([^"]*)" in file$/) do |text|
  pending
end

Then(/^I should be able to change file permission$/) do
  pending
end

Then(/^I should be able to change file permission with params:$/) do |text|
  pending
end

Then(/^File should exist and contain text$/) do
  pending
end

Given(/^I have created file with text$/) do
  pending
end

Then(/^File should have permission$/) do
  current_permission = `ls -ld $pwd`.strip
  expect(current_permission).match /drwxr-xr-x \d+ root/
end

And(/^I execute "([^"]*)" command with params:$/) do |command, param|
  pending
end