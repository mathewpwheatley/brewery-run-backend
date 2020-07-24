class CircuitFavoritesController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    circuit_favorite = CircuitFavorite.create(circuit_favorite_params)
    if circuit_favorite.valid?
      circuit_favorite.new_favorite_notification
      render json: circuit_favorite, serializer: FavoriteSerializer, status: :accepted
    else
      render json: {errors: circuit_favorite.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    circuit_favorite = CircuitFavorite.find(params[:id])
    circuit_favorite.destroy
    render json: {messages: ['Favorite has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def circuit_favorite_params
    params.require(:circuit_favorite).permit(:user_id, :circuit_id)
  end

end
