require 'spec_helper'

describe PropertyData do

  let(:api_client) { double(:api_client, :get => fake_json_data) }
  let(:fake_json_data) {
    {
      "saon" => "A",
      "street" => "Test Street",
      "town" => "Plymouth",
      "coordinates" => {"latitude" => "100", "longitude" => "100"}
    }
  }
  let(:postcode) { "PL9 8TB" }
  let(:address_string) { "testaddressstring"}

  it "calls the property API with the postcode and address string" do
    property_data = described_class.new(api_client)
    property_data.find(postcode, address_string)
    expect(api_client).to have_received(:get).with("/properties/PL9%208TB/testaddressstring")
  end

  it "formats the address in a correct way" do
    property_data = described_class.new(api_client)
    result = property_data.find(postcode, address_string)
    expect(result[:address]).to eq("A Test Street Plymouth")
  end
end
