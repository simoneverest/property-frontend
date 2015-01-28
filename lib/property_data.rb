require 'open-uri'
class PropertyData

  def initialize(api_client)
    @api_client = api_client
  end

  def find(postcode, address_string)
    property_json = get_property_json(postcode, address_string)
    format_property_json(property_json)
  end

  def hello
  end

  private

  def get_property_json(postcode, address_string)
    @api_client.get("/properties/#{URI::encode(postcode)}/#{URI::encode(address_string)}")
  end

  def format_property_json(property_json)
    coordinates = property_json["coordinates"]
    result = {
      :address => format_address(property_json),
      :property_type => property_json["property_type"],
      :price_paid_info => {:price => property_json["amount"], :date => property_json["date"]},
    }
    if coordinates
      result.merge(
        :coordinates => {:latitude => coordinates["latitude"], :longitude => coordinates["longitude"]}
      )
    end
    result
  end

  def format_address(property_json)
    ["paon", "saon", "street", "town", "county", "postcode"].map do |key|
      property_json[key]
    end.compact.join(" ")
  end
end
