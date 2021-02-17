# frozen_string_literal: true

require 'singleton'
require 'yaml'

class ConfigHelper
  include Singleton

  CONFIG_FILE_PATH = 'config/main_config.yml'

  def initialize
    @config = YAML.load_file(CONFIG_FILE_PATH)
  end

  def [](key)
    @config[key]
  end
end
