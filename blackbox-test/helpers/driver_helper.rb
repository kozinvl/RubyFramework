# frozen_string_literal: true

module DriverHelper
  module_function

  def browser
    ConfigHelper.instance[:browser]
  end

  def register_browser
    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app,
                                     browser: :remote,
                                     url: "http://#{browser[:host]}:#{browser[:port]}/wd/hub",
                                     desired_capabilities: browser_capabilities)
    end
    Capybara.default_driver = browser[:name]
    Capybara.current_driver = browser[:name]
    Capybara.default_max_wait_time = browser[:default_max_wait_time]
  end

  def browser_capabilities
    opts = { chromeOptions:
               { args: browser[:capabilities] }
    }
    Selenium::WebDriver::Remote::Capabilities.chrome(opts)
  end
end
