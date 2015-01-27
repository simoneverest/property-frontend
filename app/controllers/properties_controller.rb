class PropertiesController < ApplicationController
  require 'land_registry_api'

  def show
    api = LandRegistryApi.new
    @property = api.get(params[:postcode], params[:address_string])
  end
end
