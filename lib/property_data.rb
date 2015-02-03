require 'open-uri'
class PropertyData

  def initialize(api_client)
    @api_client = api_client
  end

  def find(postcode, address_string)
    #if the postcode is bla and address_strinh is bleugh (the one case we're hardcoding)
    #then preoptty_json = hardcoded_thing
    if postcode == "PL9 8TB" and address_string == "southernway_43"
      property_json = fake_address_json
    else
      property_json = get_property_json(postcode, address_string)
    end
    format_property_json(property_json)
  end

  private

  def get_property_json(postcode, address_string)
    @api_client.get("/properties/#{URI::encode(postcode)}/#{URI::encode(address_string)}")
  end

  def fake_address_json
    {
      "paon" => "43",
      "street" => "Southernway",
      "town" => "Plymouth",
      "postcode" => "PL9 8TB",
      "property_type" => "terraced",
      "coordinates" => {"latitude" => "100", "longitude" => "100"},
      "price" => "250000",
      "date" => "04-04-2011",
    }
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
