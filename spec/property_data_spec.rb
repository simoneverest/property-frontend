require 'spec_helper'

describe PropertyData do

  let(:api_client) { double(:api_client, :get => fake_json_data) }
  let(:fake_json_data) {
    {
      "paon" => "A",
      "saon" => "B",
      "street" => "Test Street",
      "town" => "Plymouth",
      "county" => "Devon",
      "postcode" => "PL8 2JF",
      "property type" => "House",
      "price paid info" => {"amount" => 3, "date" => "23rd June"},
      "coordinates" => {"latitude" => 23.6, "longitude" => 15.4}
    }
  }
  let(:postcode) { "PL9 8TB" }
  let(:address_string) { "testaddressstring"}

  it "calls the property API with the postcode and address string" do
    property_data = described_class.new(api_client)
    property_data.find(postcode, address_string)
    expect(api_client).to have_received(:get).with("/properties/PL9%208TB/testaddressstring")
  end

  it "formats a full address correctly" do
    property_data = described_class.new(api_client)
    result = property_data.find(postcode, address_string)
    expect(result[:address]).to eq("A B Test Street Plymouth Devon PL8 2JF")
  end
=begin
  it "formats a partial address correctly" do
    true
  end
=end
=begin
  it "returns the appropriate response when no map coordinates are found" do
    true
  end
=end
=begin
  it "returns the appropriate response when no PPI data is found" do
    true
  end
=end
end
