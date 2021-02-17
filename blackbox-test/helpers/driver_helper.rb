# frozen_string_literal: true

module DriverHelper
  module_function

  def register_browser
    if browser_settings[:run_in_docker]
      Capybara.register_driver :selenium_chrome do |app|
        Capybara::Selenium::Driver.new(app,
                                       browser_settings: :remote,
                                       url: remote_browser_url,
                                       desired_capabilities: browser_capabilities)
      end
    end
    Capybara.default_driver = browser_name
    Capybara.current_driver = browser_name
    Capybara.default_max_wait_time = browser_settings[:default_max_wait_time]
  end

  def browser_capabilities
    opts = { chromeOptions:
               { args: browser_settings[:capabilities] }
    }
    Selenium::WebDriver::Remote::Capabilities.chrome(opts)
  end

  def browser_settings
    ConfigHelper.instance[:browser_settings]
  end

  def remote_browser_url
    "http://#{browser_settings[:host]}:#{browser_settings[:port]}/wd/hub"
  end

  def browser_name
    browser_settings[:name]
  end
end
