When(/^I open landing page$/) do
  web_app.page.open
end

Then(/^I should be able to see landing page$/) do
  expect(web_app.page.title.text).to eq CommonVars::TITLE
end

And(/^the navigation bar should include the following columns:$/) do |table|
  actual_result = web_app.landing_page.navigate_tab
  table.hashes.each_entry do |expected|
    expect(actual_result).to include expected['Column']
  end
end

When(/^I open login page$/) do
  steps %{
    And I open landing page
        }
  web_app.landing_page.my_account.click
  web_app.landing_page.login.first.click
end

And(/^I type correct password$/) do
  web_app.login_page.log_in(CommonVars::USER_MAIL,
                            CommonVars::USER_PASSWORD)
end

Then(/^the UserAccountPage should be opened$/) do
  expect(page.current_url).to include(web_app.user_account_page.url_matcher)
end