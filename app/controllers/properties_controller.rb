class PropertiesController < ApplicationController
  require 'property_data'
  require 'api_client'
  require 'rest_client'

  def show
    api_client = ApiClient.new(Rails.application.config.property_title_api_url)
    begin
      data_repository = PropertyData.new(api_client)
      @property = data_repository.find(params[:postcode], params[:address_string])
      unless @property
        @error = "Property data unavailable"
        render 'error'
      end
    rescue RestClient::ResourceNotFound
      @error = "Property not found"
      render 'error', :status => 404
    end
  end

  def postcode_index

  end
end
