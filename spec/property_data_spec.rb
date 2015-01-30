require 'spec_helper'

describe PropertyData do
  let(:api_client) { double(:api_client, :get => full_json_data)}
  let(:full_json_data) {
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
  let(:partial_json_data) {
    {
      "street" => "Partial Street",
      "town" => "Plymouth",
      "postcode" => "PL3 7TH"
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
  context "partial json api"do
    let(:api_client) { double(:api_client, :get => partial_json_data)}
    it "formats a partial address correctly" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:address]).to eq("Partial Street Plymouth PL3 7TH")
    end
  end

=begin
  it "returns the appropriate response when no map coordinates are found" do
    This test is not required in this user story
  end
=end
=begin
  it "returns the appropriate response when no PPI data is found" do
    This test is not required in this user story
  end
=end
end
