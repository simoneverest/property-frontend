class PropertiesController < ApplicationController
  require 'property_data'

  def show
    data_repository = PropertyData.new
    @property = data_repository.find(params[:postcode], params[:address_string])
  end
end
