class BreweryFavoritesController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    brewery_favorite = BreweryFavorite.create(brewery_favorite_params)
    if brewery_favorite.valid?
      render json: brewery_favorite, serializer: FavoriteSerializer, status: :accepted
    else
      render json: {errors: brewery_favorite.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    brewery_favorite = BreweryFavorite.find(params[:id])
    brewery_favorite.destroy
    render json: {messages: ['Favorite has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def brewery_favorite_params
    params.require(:brewery_favorite).permit(:user_id, :brewery_id)
  end

end
