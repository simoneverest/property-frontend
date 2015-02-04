
#
# You shouldn't use urls like http://fixtures.landregistry.local as this will work locally
# but not in CI. So we need to use variables which can be over written.
# The commands below work as:
#   $URL_Variable_Name = (If_Not_Empty_Then_Use_This_Value ||(OR) This_Is_The_Default_Value )
#
# The ENV[] are defined as system variables, check the ./run_tests_preview.sh as an example how they are overridden
#

# Example:
$CASEWORK_FRONTEND_DOMAIN =    (ENV['CASEWORK_FRONTEND_DOMAIN']    ||   'http://casework-frontend.landregistry.local')
