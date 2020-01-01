module DriverHelper
  extend self

  def register_browser
    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app,
                                     browser: :remote,
                                     url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub",
                                     desired_capabilities: browser_capabilities)
    end
    Capybara.default_driver = :selenium_chrome
    Capybara.current_driver = :selenium_chrome
    Capybara.default_max_wait_time = 40
  end

  def browser_capabilities
    opts = { chromeOptions:
                { args:
                     ['--window-size=1360,998',
                      '--ignore-certificate-errors']
                }
           }
    Selenium::WebDriver::Remote::Capabilities.chrome(opts)
  end
end
