class PropertiesController < ApplicationController
  require 'property_data'
  require 'api_client'
  require 'rest_client'

  def show
    api_client = ApiClient.new(Rails.application.config.land_registry_api_url)
    data_repository = PropertyData.new(api_client)
    @property = data_repository.find(params[:postcode], params[:address_string])
  end
end
