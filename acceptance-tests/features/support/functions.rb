def create_property_in_db(prop_data)

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

  create_property_sql = <<-eos
INSERT INTO "address_base" (
    "uprn",
    "toid",
    "udprn",
    "organisationName",
    "departmentName",
    "poBoxNumber",
    "buildingName",
    "subBuildingName",
    "buildingNumber",
    "dependentThoroughfareName",
    "thoroughfareName",
    "postTown",
    "doubleDependentLocality",
    "dependentLocality",
    "postcode",
    "postcodeType",
    "positionX",
    "positionY",
    "rpc",
    "changeType",
    "startDate",
    "entryDate",
    "lastUpdateDate",
    "primaryClass",
    "processDate"
) VALUES (
    1456456,
    123,
    2,
    'organisationName val',
    'departmentName val',
    'poBoxN',
    'building name',
    'todo',
    '#{house_number}',
    'dependentThoroughfareName val',
    '#{street_name}',
    'postTown val',
    'doubleDependentLocality val',
    'dependentLocality val',
    '#{postcode}',
    'P',
    #{position_x || 'NULL'},
    #{position_y || 'NULL'},
    4,
    'C',
    '2000-12-01',
    '2000-12-02',
    '2000-12-03',
    'C',
    '2000-12-04'
);
eos

  # calls the database conection - settings in the config.rb
  # and executes the create property sql
  $db_connection.exec(create_property_sql)
end

# connect to the database and execute the sql (that deletes everything)
def delete_all_properties
  $db_connection.exec("DELETE FROM address_base;")
end
