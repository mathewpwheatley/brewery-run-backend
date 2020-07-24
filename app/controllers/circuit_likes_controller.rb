class CircuitLikesController < ApplicationController
  # authorized runs before each methd as it is called from ApplicationController

  def create
    circuit_like = CircuitLike.create(circuit_like_params)
    if circuit_like.valid?
      new_like_notification(like)
      render json: circuit_like, serializer: LikeSerializer, status: :accepted
    else
      render json: {errors: circuit_like.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    circuit_like = CircuitLike.find(params[:id])
    circuit_like.destroy
    render json: {messages: ['Like has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def circuit_like_params
    params.require(:circuit_like).permit(:user_id, :circuit_id)
  end

  def new_like_notification(like)
    circuit = Circuit.find(like.circuit_id)
    user_name = User.find(like.user_id).full_name
    title = "Your circuit is getting some attention!"
    content = "#{user_name} just liked your circuit #{circuit.title}. "
    link = "/circuits/#{circuit.id}"
    Notification.create(title: title, content: content, link: link, user_id: circuit.user.id)
  end

end
