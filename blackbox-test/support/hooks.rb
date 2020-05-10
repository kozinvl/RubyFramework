Before do |test|
  puts "Current scenario: #{test.feature.name}: #{test.name}"
end

After('@web_ui') do |test|
  if test.failed?
    screenshot_path = "test-reports/#{test.name.gsub(' ', '_')}.png"
    web_app.page.save_screenshot(screenshot_path)
    puts "Screenshot can be found at #{screenshot_path}"
  end
end

Before('@system') do
  FileUtils.mkdir_p("#{CommonVars::SYS_TEST}")
end

After('@system') do
  puts "\nCleaning up\t"
  FileUtils.cd("#{CommonVars::DIR_VAR}")
  FileUtils.rm_r("#{CommonVars::SYS_TEST}")
end
