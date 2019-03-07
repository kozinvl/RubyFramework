After do |scenario|
  if scenario.failed?
    screenshot_path = "test-reports/#{Time.now.to_i}.png"
    @web_app.page.save_screenshot(screenshot_path)
    puts "  Screenshot: #{screenshot_path} saved"
  end
end