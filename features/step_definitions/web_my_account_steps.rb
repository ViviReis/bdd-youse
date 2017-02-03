#encoding: utf-8

Before()do
  @account = WebMyAccountPage.new
  @quotation = WebQuotationPage.new
end


Given(/^I am on Youse$/) do
  @account.home
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

When(/^I register in Youse's website$/) do
  @account.register
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

Given(/^I am logged in Youse's website$/) do
  @account.logged
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

When(/^I click on "([^"]*)"$/) do |button|
  @account.click(button)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

When(/^I fill in "([^"]*)" field$/) do |field|
  @account.register(field)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

When(/^I fill in "([^"]*)"$/) do |field|
  @account.login(field)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

When(/^I put mouse over "([^"]*)"$/) do |over|
  @account.mouseover(over)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

Then(/^I should see message "([^"]*)"$/) do |message|
  assert_text(message)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end
