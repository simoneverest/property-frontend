class ApiClient

  def initialize(url_base)
    @url_base = url_base
  end

  def get(url_string)
    property_data = RestClient::Resource.new(@url_base + url_string)
    property_data.get

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
end
