require 'require_all'
require 'selenium-webdriver'
require 'capybara/cucumber'
require 'site_prism'
require 'pry'
require 'fileutils'

require_all './lib', './page', './helpers'

def web_app
  @web_app ||= WebApp.new
end

#### driver setup ####
DriverHelper.register_browser

