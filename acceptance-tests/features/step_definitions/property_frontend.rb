Given(/^I am a citizen$/) do
  # Do Nothing
end

Given(/^I have a property$/) do
  $property_data = Hash.new();
  $property_data['ppi'] = Hash.new();
  $property_data['ppi']['date'] = '2009-09-30';
  $property_data['ppi']['amount'] = '107500';

  message = '{ "head": { "vars": [ "amount" , "date" , "property_type" ] } , "results": { "bindings": [ { "amount": { "datatype": "http://www.w3.org/2001/XMLSchema#integer" , "type": "typed-literal" , "value": "' + $property_data['ppi']['amount'] + '" } , "date": { "datatype": "http://www.w3.org/2001/XMLSchema#date" , "type": "typed-literal" , "value": "' + $property_data['ppi']['date'] + '" } , "property_type": { "type": "uri" , "value": "http://landregistry.data.gov.uk/def/common/terraced" } } ] } }'
  rest_post_call('http://landregistry.local:8002/set_ppi', nil, message)
end

When(/^I view the property detail page$/) do
  visit('http://172.16.42.43:8001/properties/PL9%208TB/Southernway_43')

end

Then(/^I see the price paid of the property$/) do
  expect(page.text).to match(/#{$property_data['ppi']['date']}/i)
  expect(page.text).to match(/#{$property_data['ppi']['amount']}/i)

end
