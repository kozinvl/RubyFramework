When(/^I open landing page$/) do
  web_app.page.open
end

Then(/^I should be able to see landing page$/) do
  expect(web_app.landing_page.title.text).to eq CommonVars::TITLE
end

And(/^the navigation bar should include the following columns:$/) do |table|
  actual_result = web_app.landing_page.navigate_tab
  table.hashes.each_entry do |expected|
    expect(actual_result).to include expected['Column']
  end
end

When(/^I open login page$/) do
  step open landing page
  web_app.landing_page.my_account.click
  web_app.landing_page.login.first.click
end

And(/^I type correct password$/) do
  web_app.login_page.log_in(CommonVars::USER_MAIL,
                            CommonVars::USER_PASSWORD)
end

Then(/^the UserAccountPage should be opened$/) do
  begin
    expect(page.current_url).to include(web_app.user_account_page.url_matcher)
  rescue StandardError => e
    retry
  end
end

And(/^I choose "([^"]*)" option$/) do |option|
  case option
  when 'visa'
    web_app.landing_page.visa.click
  when 'cars'
    web_app.landing_page.cars.click
  else
    raise "#{option} is not supported"
  end
end

And(/^I select "([^"]*)" and "([^"]*)"$/) do |departure_country, arrival_country|
  web_app.landing_page.country_to_visa departure_country, arrival_country
end

And(/^I search query$/) do
  web_app.landing_page.search_visa_button.click
end

Then(/^I should be able to see notification:$/) do |table|
  sleep 3
  actual_visa = web_app.landing_page.requirements_visa.map(&:text).select { |x| x.empty? }
  expected_visa = table.raw.map(&:first)
  expect(actual_visa).to eq expected_visa
end
