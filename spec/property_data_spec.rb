require 'spec_helper'

describe PropertyData do

  let(:api_client) { double(:api_client, :get => full_json_data)}
  let(:full_json_data) {
    {
      "property" => {
        "paon" => "A",
        "saon" => "B",
        "street" => "Test Street",
        "town" => "Plymouth",
        "county" => "Devon",
        "postcode" => "PL8 2JF",
        "property_type" => "House",
        "amount" => 25000,
        "date" => "23-01-2009",
        "coordinates" => {"x" => 23.6, "y" => 15.4}
      }
    }
  }

  let(:partial_json_data) {
    {
      "property" => {
        "street" => "Partial Street",
        "town" => "Plymouth",
        "postcode" => "PL3 7TH"
      }
    }
  }

  let(:complicated_caps) {
    {
      "property" => {
        "paon" => "2D",
        "street" => "MCDONALDS O'BRIEN VON STREIT MACDONALDS DE LA TOUR DI CAPRIO ST. JOHN STREET",
        "town" => "PLYMOUTH",
        "postcode" => "PL3 7TH"
      }
    }
  }

  let(:no_amount_ppi) {
     {
       "property" => {
         "county" => "Devon",
         "postcode" => "PL8 2JF",
         "property type" => "House",
         "date" => "23-01-2009",
       }
     }
   }
   let(:no_date_ppi) {
      {
        "property" => {
          "county" => "Devon",
          "postcode" => "PL8 2JF",
          "property type" => "House",
          "amount" => 25000,
        }
      }
  }
  let(:postcode) { "PL9 8TB" }
  let(:empty_postcode) { "" }
  let(:address_string) { "testaddressstring"}
  let(:empty_address_string) { "" }

  context "All data available" do
    it "calls the property API with the postcode and address string" do
      property_data = described_class.new(api_client)
      property_data.find(postcode, address_string)
      expect(api_client).to have_received(:get).with("/properties/PL9%208TB/testaddressstring")
    end

    it "a full address is formatted correctly" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:address]).to eq(["B", "A Test Street", "Plymouth", "Devon", "PL8 2JF"])
    end

    it "Displays Property type information in correct format" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:property_type]).to eq("House")
    end

    it "Displays PPI information in correct format" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("£25,000 on 23 January 2009")
    end
  end

  context "No property type and no PPI information" do
    let(:api_client) { double(:api_client, :get => partial_json_data)}
    it "a partial address is formatted correctly" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:address]).to eq(["Partial Street", "Plymouth", "PL3 7TH"])
    end

    it "The message 'Not Available' is displayed for property type" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:property_type]).to eq("Not Available")
    end

    it "The message 'Not Available' is displayed for PPI" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("Not Available")
    end
  end

  context "PPI information with no amount but with a date" do
    let(:api_client) { double(:api_client, :get => no_amount_ppi)}
    it "The message 'Not Available' is displayed for PPI" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("Not Available")
    end
  end

  context "PPI information with no date but with an amount" do
    let(:api_client) { double(:api_client, :get => no_date_ppi)}
    it "The message 'Not Available' is displayed for PPI" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:price_paid_info]).to eq("Not Available")
    end
  end

  context "Address is in addressbase format with complicated capitalisation" do
    let(:api_client) { double(:api_client, :get => complicated_caps)}
    it "Capitalises the address properly" do
      property_data = described_class.new(api_client)
      result = property_data.find(postcode, address_string)
      expect(result[:address]).to eq(
        [
          "2D McDonalds O'Brien von Streit MacDonalds de la Tour di Caprio St. John Street",
          "Plymouth",
          "PL3 7TH"
        ]
      )
    end
  end

end
