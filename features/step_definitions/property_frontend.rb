Given(/^I am a citizen$/) do

end

Given(/^I have a property$/) do

end

Given(/^it has most recent price paid value$/) do

end

Given(/^it has the most recent price paid date$/) do

end

Given(/^it has property type$/) do

end

When(/^I view the property detail page$/) do
  visit ("http://localhost:8001/properties/PL9%208TB/Southernway_43")
end

Then(/^I can see the price paid value, date and property type$/) do
  page.assert_text("£107,500 on 30 September 2010")
  page.assert_text("terraced")
end

# Commented out as was unable to run in acceptance test due to lack of real data, was covered in unit testing though.
#Given(/^it has no price paid value$/) do

#end

#Given(/^it has the no price paid date$/) do
#  pending # express the regexp above with the code you wish you had
#end

#Given(/^it has no property type$/) do
#  pending # express the regexp above with the code you wish you had
#end

#Then(/^I can see a not available message$/) do
#  pending # express the regexp above with the code you wish you had
#end
