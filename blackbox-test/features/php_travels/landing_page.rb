When(/^I open landing page$/) do
  web_app.page.open
end

Then(/^I should be able to see landing page$/) do
  EventuallyHelper.eventually do
    expect(web_app.landing_page.title.text).to eq CommonVars::TITLE
  end
end

And(/^the navigation bar should include the following columns:$/) do |table|
  actual_result = web_app.landing_page.navigate_tab
  table.hashes.each_entry do |expected|
    expect(actual_result).to include expected['Column']
  end
end

When(/^I open login page$/) do
  step 'I open landing page'
  web_app.landing_page.my_account.click
  web_app.landing_page.login.first.click
end

And(/^I type correct password$/) do
  web_app.login_page.log_in(CommonVars::USER_MAIL,
                             CommonVars::USER_PASSWORD)
end

Then(/^the UserAccountPage should be opened$/) do
  EventuallyHelper.eventually do
    expect(page.current_url).to include(@web_app.user_account_page.url_matcher)
  end
end

And(/^I choose (.*?) tab$/) do |option|
  case option
  when 'visa'
    web_app.landing_page.visa.click
  when 'cars'
    web_app.landing_page.cars.click
  else
    raise "#{option} is not supported"
  end
end

And(/^I select "([^"]*)" and "([^"]*)" location$/) do |pick_up, drop_off|
  web_app.landing_page.choice_cars pick_up, drop_off
end

And(/^I search query$/) do
  web_app.landing_page.search_cars.click
end

Then(/^I should be able to see notification "([^"]*)"$/) do |notification|
  EventuallyHelper.eventually do
    car_notification = @web_app.landing_page.search_cars_result.text
    expect(car_notification).to eq notification
  end
end
