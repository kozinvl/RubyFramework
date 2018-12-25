When(/^I was logged as user$/) do
  steps %{
    And I open login page
    And I type correct password
        }
end

And(/^I open Personal details$/) do
  web_app.user_account_page.wait_until_my_profile_visible
  web_app.user_account_page.my_profile.click
end

Then(/^I should be able to see personal details$/) do
  begin
  expect(web_app.user_account_page.first_name.value).to eq CommonVars::USER_FIRST_NAME
  expect(web_app.user_account_page.last_name.value).to eq CommonVars::USER_LAST_NAME
  expect(web_app.user_account_page.phone.value).to eq CommonVars::USER_PHONE
  rescue
    retry
  end
end