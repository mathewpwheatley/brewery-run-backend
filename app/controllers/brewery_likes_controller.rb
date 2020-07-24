class BreweryLikesController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    brewery_like = BreweryLike.create(brewery_like_params)
    if brewery_like.valid?
      render json: brewery_like, serializer: LikeSerializer, status: :accepted
    else
      render json: {errors: brewery_like.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    brewery_like = BreweryLike.find(params[:id])
    brewery_like.destroy
    render json: {messages: ['Like has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def brewery_like_params
    params.require(:brewery_like).permit(:user_id, :brewery_id)
  end

end
