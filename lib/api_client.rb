class ApiClient

  def initialize(url_base)
    @url_base = url_base
  end

  def get(url_string)
    property_data = RestClient::Resource.new(@url_base + url_string)
    JSON.parse(property_data.get)
  end
end
