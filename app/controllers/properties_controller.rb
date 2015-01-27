class PropertiesController < ApplicationController
  require 'property_data'

  def show
    data_repository = PropertyData.new
    @property = data_repository.get(params[:postcode], params[:address_string])
  end
end
