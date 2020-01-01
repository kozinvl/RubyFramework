When(/^I open landing page$/) do
  web_app.page.open
  web_app.page.wait_for_ajax
end

Then(/^I should be able to see landing page$/) do
  web_app.landing_page.wait_for_ajax
  EventuallyHelper.eventually do
    expect(web_app.landing_page).to have_logo
  end
end

And(/^the navigation widget should include the following columns$/) do |table|
  actual_result = web_app.landing_page.navigate_menu
  table.hashes.each_entry do |expected|
    expect(actual_result).to include expected['Travel Menu']
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

And(/^I choose (.*?) menu at navigation widget$/) do |option|
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

And(/^I make visa query$/) do
  web_app.landing_page.visa_submit.click
end

Then(/^I should be able to see notification$/) do
  notification = 'To submit your visa for approval please fill-up the below form.'
  EventuallyHelper.eventually do
    page_notification = web_app.landing_page.search_result.text
    expect(page_notification).to eq notification
  end
end

And(/^I choose ([^"]*) and ([^"]*) on visa menu$/) do |from, where|
  web_app.landing_page.choice_visa(from, where)
end

And(/^I choose (.*?) on visa date$/) do |data|
  web_app.landing_page.visa_date.set(data)
end