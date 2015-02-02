class ApiClient

  def initialize(url_base)
    @url_base = url_base
  end

  def get(url_string)

    if Rails.application.config.use_static_content
      JSON.parse( IO.read("lib/sample_json.json") )
    else
      property_data = RestClient::Resource.new(@url_base + url_string)
      JSON.parse(property_data.get)
    end

  end
end
