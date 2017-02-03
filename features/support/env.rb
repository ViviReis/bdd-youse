require 'rspec'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot'
require 'capybara-screenshot/cucumber'
require 'pry'
require 'cucumber'
require 'csv'
require 'randomstring'

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.page.driver.browser.manage.window.maximize