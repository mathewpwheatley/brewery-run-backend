class BreweriesController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    breweries = Brewery.all
    render json: breweries, each_serializer: BrewerySerializerIndex, status: :ok
  end

  def show
    brewery = Brewery.find(params[:id])
    render json: brewery, serializer: BrewerySerializerPublic, status: :ok
  end


  private
  # Only allow a list of trusted parameters through.
  # Below function is currently unused as breweries are pulled from and API upon seeding
  # def brewery_params
  #   params.require(:brewery).permit(:name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :tag_list)
  # end

end