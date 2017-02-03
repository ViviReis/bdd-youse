require "capybara/dsl"
include Capybara::DSL
Capybara.default_driver = :selenium
Capybara.page.driver.browser.manage.window.maximize