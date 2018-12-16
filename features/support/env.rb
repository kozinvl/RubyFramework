require 'require_all'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'site_prism'

require_all './lib', './page'


def web_app
  @web_app ||= WebApp.new
end

### driver setup ###
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument("--window-size=1360,998")
  options.add_argument("--ignore-certificate-errors")

  Capybara::Selenium::Driver.new(app,
                                 browser: :chrome,
                                 options: options
  )
end

Capybara.default_driver = :selenium_chrome
Capybara.current_driver = :selenium_chrome

