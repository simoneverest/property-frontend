class LandRegistryApi
  def get(postcode, address_string)
    #call the api with params postcode and address_string
    #take that json and format it so that it looks like the thing below!

    # When you need access the property api, you should it using the following:
    # url = ENV['PROPERTY_API'] + '/properties/.../...'

    {
      :address => "21 Murhill Lane",
      :property_type => "house",
      :price_paid_info => {:price => "200", :date => '12/12/2013'},
      :council_info => {:name => 'devon', :url => 'www.bbc.co.uk'},
      :coordinates => {:latitude => '100', :longitude => '100'},
    }
  end
end
