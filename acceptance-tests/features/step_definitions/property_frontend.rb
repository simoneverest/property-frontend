Given(/^I am a citizen$/) do
  # Do Nothing
end

Given(/^I have a property$/) do
  $property_data = Hash.new();

# create a new hash that will contain address data
  $property_data['address'] = Hash.new();
  $property_data['address']['house_number'] = '43';
  $property_data['address']['street_name'] = 'Southernway';
  $property_data['address']['postcode'] = 'PL9 8TB';
  $property_data['address']['position_x'] = -1.2345;
  $property_data['address']['position_y'] = -5.4321;
# calls a function to get rid of existing data to remove chance of duplicate rows
  delete_all_properties
# call the function that will insert our hash data into the database
  res = create_property_in_db($property_data)
end

# go the url that is the property front -
# url is built using the address
# hash created above.
When(/^I view the property detail page$/) do
  postcode = URI.escape($property_data['address']['postcode'])
  visit('http://landregistry.local:8000/properties/'+postcode+'/' + $property_data['address']['street_name']+'_'+$property_data['address']['house_number'])
end

# then look for an xpath, assigning the value in to a var
# check the xpath value matches the initial value passed into the db
Then(/^I see the full address of the property$/) do
  postcode = page.find('//*[@id="content"]/div[1]/div[3]/div/div[1]/h2[5]')
  expect(postcode.text).to eq($property_data['address']['postcode'])

  street_name = page.find('//*[@id="content"]/div[1]/div[3]/div/div[1]/h2[2]')
  full_street_name = "#{$property_data['address']['house_number']} #{$property_data['address']['street_name']}"
  expect(street_name.text).to eq(full_street_name)
end

Given(/^I try to view a property that does not exist$/) do

  $property_data = Hash.new();

# create a new hash that will contain address data for an address that doesn't exist
# we use this format so the address we create will be passed into the search URL
  $property_data['address'] = Hash.new();
  $property_data['address']['house_number'] = '41';
  $property_data['address']['street_name'] = 'Southernway';
  $property_data['address']['postcode'] = 'PL9 8TB';
  $property_data['address']['position_x'] = -1.1111;
  $property_data['address']['position_y'] = -2.2222;
# calls a function to get rid of existing data to ensure the address won't be found
  delete_all_properties
end

# looking for a non-existant address which should return a 'sensible' message
Then(/^I get a page not found message$/) do
# find the xpath to the object we want to check and assign to a variable
  message = page.find('//*[@id="content"]/h1')
# check that the xpath object contains the desired value
  expect(message.text).to eq('Property not found')
end

Then(/^I see the map to the correct coordinates$/) do
  map = page.find('//*[@id="content"]/div[1]/div[3]/div/div[2]/img')
  expect(map['src']).to include(sprintf('%.3f',$property_data['address']['position_x']))
  expect(map['src']).to include(sprintf('%.3f',$property_data['address']['position_y']))
end

Given(/^I have a property that does not have location coordinates$/) do
  $property_data = Hash.new();

# create a new hash that will contain address data
  $property_data['address'] = Hash.new();
  $property_data['address']['house_number'] = '43';
  $property_data['address']['street_name'] = 'Southernway';
  $property_data['address']['postcode'] = 'PL9 8TB';
# calls a function to get rid of existing data to remove chance of duplicate rows
  delete_all_properties
# call the function that will insert our hash data into the database
  res = create_property_in_db($property_data)
end

Then(/^a message is shown in place of the map section$/) do
  map_unavailable = page.find('//*[@id="content"]/div[1]/div[3]/div/div[2]/h3')
  expect(map_unavailable.text).to eq ("No map available")
end

Then(/^a hyperlink to LR statutory services should be available$/) do

end

When(/^I click the LR Statutory services link$/) do

end

Then(/^I am taken to the Find a Property service$/) do

end
