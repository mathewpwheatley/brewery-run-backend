class CircuitFavoritesController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    circuit_favorite = CircuitFavorite.create(circuit_favorite_params)
    if circuit_favorite.valid?
      new_favorite_notification(circuit_favorite)
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

  def new_favorite_notification(favorite)
    circuit = Circuit.find(favorite.circuit_id)
    user_name = User.find(favorite.user_id).full_name
    title = "Your circuit is my favorite!"
    content = "#{user_name} just favorited your circuit #{circuit.title}. "
    link = "/circuits/#{circuit.id}"
    Notification.create(title: title, content: content, link: link, user_id: circuit.user.id)
  end

end
