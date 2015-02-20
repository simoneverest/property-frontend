def create_property_in_es(property_data)

# these are the variables that are being set to insert test data
# the initial values are created in the $property_data hash and
# passed when the function is called

  house_number = property_data['house_number']
  street_name = property_data['street_name']
  postcode = property_data['postcode']
  position_x = property_data['position_x']
  position_y = property_data['position_y']

  #TODO: insert in local elasticsearch
end

# delete all indices in elasticsearch
def delete_all_properties
  #TODO: remote from local elasticsearch
end
