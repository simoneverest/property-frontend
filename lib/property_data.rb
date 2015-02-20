require 'open-uri'
require 'action_view'
require 'namecase'

class PropertyData

  def initialize(api_client)
    @api_client = api_client
  end

  def find(postcode, address_string)
    property_json = get_property_json(postcode, address_string)
    unless property_json["message"] == "No record found."
      format_property_json(property_json["property"])
    end
  end

  private

  def get_property_json(postcode, address_string)
    @api_client.get("/properties/#{URI::encode(postcode)}/#{URI::encode(address_string)}")
  end

  def unavailable_data
    "Not Available"
  end

  def format_property_json(property_json)
    coordinates = property_json["coordinates"]
    property_type = property_json["property_type"]
    address_hash = {
      :address => format_address(property_json),
      :property_type => property_type ? property_type.capitalize : unavailable_data,
      :price_paid_info => format_ppi(property_json)
    }
    # If coordinates are returned from the API then put these into address_hash
    if coordinates && coordinates["x"] && coordinates["y"]
      address_hash[:coordinates] = {:x => coordinates["x"], :y => coordinates["y"]}
    end
    address_hash
  end

  def format_address(property_json)
    saon = capitalise_if_exists(property_json["saon"])
    paon = property_json["paon"]
    street = capitalise_if_exists(property_json["street"])
    paon_street = [paon, street].compact.join(" ")
    rest_of_address = ["town", "county"].map do |key|
      capitalise_if_exists(property_json[key])
    end
    address_lines = ([saon, paon_street] + rest_of_address).compact
    address_lines + [property_json["postcode"]]
  end

  def format_ppi(property_json)
    if property_json["date"] && property_json["amount"]
      date = DateTime.parse(property_json["date"]).strftime("%-d %B %Y")
      amount = ActionView::Base.new.number_with_delimiter(property_json["amount"])
      "£#{amount} on #{date}"
    else
      unavailable_data
    end
  end

  def capitalise_if_exists(string)
    NameCase(string) if string
  end

end
