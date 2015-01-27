class PropertiesController < ApplicationController


  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all
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
