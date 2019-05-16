Before do |scenario|
  puts "#{scenario.name}"
end

After do |scenario|
  scenario.source_tag_names.each do |tag|
    if tag.include?('@web_ui') && scenario.failed?
      screenshot_path = "test-reports/#{Time.now.to_i}.png"
      web_app.page.save_screenshot(screenshot_path)
      puts "  Screenshot: #{screenshot_path} saved"
    end
  end
end
