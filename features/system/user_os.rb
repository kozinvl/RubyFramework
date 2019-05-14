When(/^I go to "([^"]*)"$/) do |directory|
  case directory
  when 'sys_directory'
    FileUtils.cd("#{directory}")
  when 'work_directory'
    FileUtils.cd("#{directory}")
  else
    raise "#{directory} is not supported"
  end
end

And(/^I create "([^"]*)" with name "([^"]*)"$/) do |object, name|
  case object
  when 'file'
    FileUtils.touch name
  when 'dir'
    FileUtils.mkdir name
  else
    raise "#{object} is not supported"
  end
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
  steps %{
    When I go to sys_directory
    And I create file with name readme.md
       }
end

Then(/^File should have permission$/) do
  current_permission = `ls -ld $pwd`.strip
  expect(current_permission).match /drwxr-xr-x \d+ root/
end

And(/^I execute "([^"]*)" in console with params:$/) do |command, param|
  pending
end
