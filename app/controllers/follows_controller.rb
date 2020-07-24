class FollowsController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    follow = Follow.create(follow_params)
    if follow.valid?
      render json: follow, serializer: FollowSerializer, status: :accepted
    else
      render json: {errors: follow.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy
    render json: {messages: ['Follow has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def follow_params
    params.require(:follow).permit(:followee_id, :follower_id)
  end

end
