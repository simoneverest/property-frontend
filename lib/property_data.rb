require 'open-uri'
class PropertyData

  def initialize(api_client)
    @api_client = api_client
  end

  def find(postcode, address_string)
    property_json = get_property_json(postcode, address_string)
    format_property_json(property_json)
  end

  private

  def get_property_json(postcode, address_string)
    @api_client.get("/properties/#{URI::encode(postcode)}/#{URI::encode(address_string)}")
  end

  def format_property_json(property_json)
    unavailable_data_message = ("Not Available")
    coordinates = property_json["coordinates"]
    address_hash = {
      :address => format_address(property_json),
      :property_type => property_json.fetch("property_type", unavailable_data_message),
      :price_paid_info => {:price => property_json.fetch("price", unavailable_data_message), :date => property_json.fetch("date", unavailable_data_message)}
    }
    # If coordinates are returned from the API then put these into address_hash
    if coordinates
      address_hash[:coordinates] = {:latitude => coordinates["latitude"], :longitude => coordinates["longitude"]}
    end
    address_hash
  end

  def format_address(property_json)
    ["paon", "saon", "street", "town", "county", "postcode"].map do |key|
      property_json[key]
    end.compact.join(" ")
  end
end
