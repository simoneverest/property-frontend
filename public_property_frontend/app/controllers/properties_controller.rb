class PropertiesController < ApplicationController
  require 'rest_client'


  API_BASE_URL = "nothing here yet" # base url of the API

  def index
    #uri = "#{API_BASE_URL}/users.json" # specifying json format in the URl
    #rest_resource = RestClient::Resource.new(uri) # It will create new rest-client resource so that we can call different methods of it
    #properties = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
    properties = {
      :street  => 'Murhill Lane',
      :postcode => 'PL9 7FN',
    }.to_json
    @properties = JSON.parse(properties, :symbolize_names => true) # we will convert the return data into array of hash.see json data parsing here
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end



  private

    # Never trust parameters from the scary internet, only allow the white list through.
    #def property_params
    #  params[:property]
    #end
end
