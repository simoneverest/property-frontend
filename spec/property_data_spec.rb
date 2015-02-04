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
      "amount" => 25000,
      "date" => "23-01-2009",
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
  let(:no_amount_ppi) {
     {
       "county" => "Devon",
       "postcode" => "PL8 2JF",
       "property type" => "House",
       "date" => "23-01-2009",
     }
   }
   let(:no_date_ppi) {
      {
        "county" => "Devon",
        "postcode" => "PL8 2JF",
        "property type" => "House",
        "amount" => 25000,
      }
  }
  let(:postcode) { "PL9 8TB" }
  let(:empty_postcode) { "" }
  let(:address_string) { "testaddressstring"}
  let(:empty_address_string) { "" }

  it "calls the property API with the postcode and address string" do
    property_data = described_class.new(api_client)
    property_data.find(postcode, address_string)
    expect(api_client).to have_received(:get).with("/properties/PL9%208TB/testaddressstring")
  end

  it "formats a full address correctly" do
    property_data = described_class.new(api_client)
    result = property_data.find(postcode, address_string)
    expect(result[:address]).to eq(["B", "A Test Street", "Plymouth", "Devon", "PL8 2JF"])
  end

  it "Displays PPI information" do
    property_data = described_class.new(api_client)
    result = property_data.find(postcode, address_string)
    expect(result[:price_paid_info]).to eq("£25,000 on 23 January 2009")
  end

  context "partial json api" do
    let(:api_client) { double(:api_client, :get => partial_json_data)}
    it "formats a partial address correctly" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:address]).to eq(["Partial Street", "Plymouth", "PL3 7TH"])
    end

    it "provides message if property type is not available" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:property_type]).to eq("Not Available")
    end

    it "provides the correct unavailable message when there is no date or amount for the ppi" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("Not Available")
    end
  end

  context "no amount ppi" do
    let(:api_client) { double(:api_client, :get => no_amount_ppi)}
    it "it provides the correct unavailable message when there is no amount for the ppi" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("Not Available")
    end
  end
  context "no date ppi" do
    let(:api_client) { double(:api_client, :get => no_date_ppi)}
    it "it provides the correct unavailable message when there is no date for the ppi" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("Not Available")
    end
  end

end
