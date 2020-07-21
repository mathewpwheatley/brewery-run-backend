class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show, :update, :destroy]
  # Skip user authorization for now
  skip_before_action :authorized

  def index
    breweries = Brewery.all
    render json: breweries, serializer_each: BreweryIndexSerializer, status: :ok
  end

  def show
    render json: @brewery, serializer: BrewerySerializer, status: :ok
  end

  def create
    brewery = Brewery.create(brewery_params)
    if brewery.vaild?
      render json: brewery, serializer: BrewerySerializer, status: :created
    else
      render json: {errors: brewery.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @brewery.update(brewery_params)
    if @brewery.valid?
      render json: @brewery, serializer: BrewerySerializer, status: :accepted
    else
      render json: {errors: @brewery.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @brewery.destroy
    render status: :no_content
  end

  private
  def set_brewery
    @brewery = Brewery.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def brewery_params
    params.require(:brewery).permit(:name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :tag_list)
  end

end