require "rspec"
require "capybara"
require "capybara/rspec"

require_relative "../app"

Capybara.app = Sinatra::Application
