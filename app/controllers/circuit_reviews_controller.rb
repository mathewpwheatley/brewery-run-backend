class CircuitReviewsController < ApplicationController
  # authorized comes from ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    circuit_review = CircuitReview.find(params[:id])
    render json: circuit_review, serializer: ReviewSerializer, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def circuit_review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :circuit_id)
  end

end
