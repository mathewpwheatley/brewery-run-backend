class CircuitReviewsController < ApplicationController
  # authorized comes from ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    circuit_review = CircuitReview.find(params[:id])
    render json: circuit_review, serializer: ReviewSerializer, status: :ok
  end

  def create
    circuit_review = CircuitReview.create(circuit_review_params)
    if circuit_review.valid?
      new_review_notification(circuit_review)
      render json: circuit_review, serializer: ReviewSerializer, status: :accepted
    else
      render json: {errors: circuit_review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    circuit_review = CircuitReview.find(params[:id])
    circuit_review.update(circuit_review_params)
    if circuit_review.valid?
      render json: circuit_review, serializer: ReviewSerializer, status: :accepted
    else
      render json: {errors: circuit_review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    circuit_review = CircuitReview.find(params[:id])
    circuit_review.destroy
    render json: {messages: ['Review has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def circuit_review_params
    params.require(:circuit_review).permit(:title, :content, :rating, :user_id, :circuit_id)
  end

  def new_review_notification(circuit_review)
    circuit = Circuit.find(circuit_review.circuit_id)
    user_name = User.find(circuit_review.user_id).full_name
    title = "You got a new circuit review!"
    content = "#{user_name} just wrote a review about circuit #{circuit.title} with a rating of #{circuit_review.rating}. "
    link = "/circuits/#{circuit.id}"
    Notification.create(title: title, content: content, link: link, user_id: circuit.user.id)
  end

end
