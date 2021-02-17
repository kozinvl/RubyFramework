module DriverHelper
  extend self

  def browser_config
    ConfigHelper.instance[:browser]
  end

  def register_browser
    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app,
                                     browser: :remote,
                                     url: "http://#{browser_config[:host]}:#{browser_config[:port]}/wd/hub",
                                     desired_capabilities: browser_capabilities)
    end
    Capybara.default_driver = :selenium_chrome
    Capybara.current_driver = :selenium_chrome
    Capybara.default_max_wait_time = browser_config[:default_max_wait_time]
  end

  def browser_capabilities
    opts = { chromeOptions:
               { args: browser_config[:capabilities] }
    }
    Selenium::WebDriver::Remote::Capabilities.chrome(opts)
  end
end
