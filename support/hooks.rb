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

Before('@system') do
  FileUtils.mkdir('/project/bbt/SYS_TEST')
end

After('@system') do
  puts "\nCleaning up\t"
  # FileUtils.rm_rf('/project/bbt/SYS_TEST')
end