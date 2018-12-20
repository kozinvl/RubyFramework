When(/^I was logged as user$/) do
  steps %{
    And I open landing page
    And I type correct password
        }
end

And(/^I open Personal details$/) do
  web_app.user_account_page.my_profile.click
end

Then(/^I should be able to see personal details$/) do
  expect(web_app.user_account_page.first_name.text).to eq CommonVars::USER_FIRST_NAME
  expect(web_app.user_account_page.last_name.text).to eq CommonVars::USER_LAST_NAME
  expect(web_app.user_account_page.phone.text).to eq CommonVars::USER_PHONE
end