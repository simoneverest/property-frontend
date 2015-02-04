require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase

  test "should get property page" do

  end

  test "should return 404 if property not found with 'Property not found' error" do
    get(:show, postcode: 'N1BLT', address_string: 'imaginary-street')
    assert_response :not_found
    assert_template :error
    assert_equal "Property not found", assigns(:error)
  end

  test "should return 'Property data unavailable' if the property data is blank" do
    get(:show, postcode: 'PL9%208TB', address_string: 'southernway_99')
    assert_response :success
    assert_template :error
    assert_equal "Property data unavailable", assigns(:error)
  end
end
