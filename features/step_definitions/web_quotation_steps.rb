#encoding: utf-8

Before()do
  @quotation = WebQuotationPage.new
end

Then(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  @quotation.fill(field, value)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

Then(/^I should see "([^"]*)"$/) do |alert|
  @quotation.message(alert)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

Then(/^I select "([^"]*)" in "([^"]*)"$/) do |value,type|
  @quotation.option(value,type)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end

Then(/^I select "([^"]*)"$/) do |value|
  @quotation.type(value)
  save_screenshot "#{Dir.pwd}/report/evidences/#{Time.now.strftime("D_%d_M_%m_Y_%Y__H_%H_M_%M_S_%S")}.png"
end
