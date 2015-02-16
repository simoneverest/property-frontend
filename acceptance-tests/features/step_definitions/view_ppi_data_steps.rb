Given(/^it has a most recent price paid value$/) do
  @price_paid_data['price_paid_value'] = 100000;
end

Given(/^it has a most recent price paid date$/) do
  @price_paid_data['price_paid_date'] = "TODO";
end

Given(/^it has a property type$/) do
  @price_paid_data['property_type'] = "Mansion";
end

Given(/^it has no most recent price paid date$/) do
  #Do nothing
end

Given(/^it has no property type$/) do
  #Do nothing
end

Then(/^I can see the price paid, value, date and property type$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see a ‘not available’ message$/) do
  pending # express the regexp above with the code you wish you had
end
