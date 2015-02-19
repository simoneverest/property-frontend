def create_property_in_elasticsearch(prop_data)

# these are the variables that are being set to insert test data
# the initial values are created in the $property_data hash and
# passed when the function is called

  house_number = prop_data['address']['house_number']
  street_name = prop_data['address']['street_name']
  postcode = prop_data['address']['postcode']
  position_x = prop_data['address']['position_x']
  position_y = prop_data['address']['position_y']

# this is the sql that will insert test data
# some values we don't care about are hard coded
# other values are passed as variable like this #{house_number}
  #TODO: create an elasticsearch index
end

# connect to the database and execute the sql (that deletes everything)
def delete_all_properties
  #TODO: delete all elasticsearch content
end
