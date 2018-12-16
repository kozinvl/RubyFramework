When(/^I open landing page$/) do
  web_app.page.open
end

Then(/^User should be able to see landing page$/) do
  expect(web_app.page.title.text).to eq CommonVars::TITLE
end

And(/^the navigation bar should include the following columns:$/) do |table|
  actual_result = web_app.landing_page.navigate_tab
  table.hashes.each_entry do |expected|
    expect(actual_result).to include expected['Column']
  end
end