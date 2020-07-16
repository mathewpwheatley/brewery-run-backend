class BreweriesController < ApplicationController
  before_action :set_brewery, only: [:show, :update, :destroy]
  # Skip user authorization for now
  skip_before_action :authorized

  def index
    breweries = Brewery.all
    render json: {breweries: BrewerySerializer.new(breweries)}, status: :ok
  end

  def show
  end

  def create
    brewery = Brewery.create(brewery_params)
    if brewery.vaild?
      render json: {brewery: BrewerySerializer.new(brewery)}, status: :created
    else
      render_errors
    end
  end

  def update
    brewery.update(brewery_params)
    if brewery.valid?
      render json: {brewery: BrewerySerializer.new(brewery)}, status: :accepted
    else
      render_errors
    end
  end

  def destroy
    brewery.destroy
    render json: {status: :no_content}
  end

  private
  def set_brewery
    brewery = Brewery.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def brewery_params
    params.require(:brewery).permit(:name, :brewery_type, :street, :city, :state, :postal_code, :country, :longitude, :latitude, :phone, :website_url, :tag_list)
  end

  # Render error messages if create/update fail
  def render_errors
    render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
  end

end