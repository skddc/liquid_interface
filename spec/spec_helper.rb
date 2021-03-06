# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(Rails)

require 'rspec/rails'
require 'mongoid'
require 'factory_girl'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir["#{Rails.root}/spec/factories/*.rb"].each {|f| require f}

Rspec.configure do |config|
  config.mock_with :rspec
  config.before(:each) do
    Mongoid.master.collections.each(&:drop)
  end
end
