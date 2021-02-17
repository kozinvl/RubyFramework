# frozen_string_literal: true

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'nokogiri'
require 'yaml'
require 'json'

desc 'Run Cucumber features for the first run'
task :run_cucumber do
  sh 'parallel_cucumber features/' do
    # ignore errors
  end
end
