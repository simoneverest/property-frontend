class PropertyData
  def find(postcode, address_string)
    property_json = get_property_json(postcode, address_string)
    format_property_json(property_json)
  end

  private

  def get_property_json(postcode, address_string)
    #We intend to replace with an actual API call
        {
          "amount" => "48000",
          "coordinates" => {"latitude" => '100', "longitude" => '100'},
          "county" => "Devon",
          "date" => "1998-06-29",
          "paon" => "21",
          "postcode" => "PL9 7FN",
          "property_type" => "flat",
          "saon" => "A",
          "street" => "Murhill Lane",
          "town" => "Plymouth"
        }
  end

  def format_property_json(property_json)
    coordinates = property_json["coordinates"]
    {
      :address => format_address(property_json),
      :property_type => property_json["property_type"],
      :price_paid_info => {:price => property_json["amount"], :date => property_json["date"]},
      :coordinates => {:latitude => coordinates["latitude"], :longitude => coordinates["longitude"]},
    }
  end

  def format_address(property_json)
    ["paon", "saon", "street", "county", "postcode"].map do |key|
      property_json[key]
    end.join(" ")
  end
end
