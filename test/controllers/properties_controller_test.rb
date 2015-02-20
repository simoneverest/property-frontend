require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase

  test "should display full address, type, coordinates and price paid info for property with PPI" do
    VCR.use_cassette('PPI data') do
      get(:show, postcode: 'PL9%208TB', address_string: 'southernway_43')
      assert_response :success
      assert_template :application
      property = assigns(:property)
      assert_equal ["Saon Goes Here", "paon goes here Street Goes Here", "Town Goes Here", "County Goes Here", "postcode goes here"], property[:address]
      assert_equal "Terraced", property[:property_type]
      assert_equal "£107,500 on 30 September 2010", property[:price_paid_info]
      assert_equal 99, property[:coordinates][:x]
      assert_equal 99, property[:coordinates][:y]
    end
  end

  test "should return 404 if property not found with 'Property not found' error" do
    VCR.use_cassette('property 404') do
      get(:show, postcode: 'N1BLT', address_string: 'imaginary-street')
      assert_response :not_found
      assert_template :error
      assert_equal "Property not found", assigns(:error)
    end
  end

  test "should return 'Property data unavailable' if the property data is blank" do
    VCR.use_cassette('no PPI data') do
      get(:show, postcode: 'PL9%208TB', address_string: 'southernway_99')
      assert_response :success
      assert_template :error
      assert_equal "Property data unavailable", assigns(:error)
    end
  end
end
