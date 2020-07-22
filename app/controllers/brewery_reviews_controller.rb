class BreweryReviewsController < ApplicationController
  # authorized comes from ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    review = BreweryReview.find(params[:id])
    render json: review, serializer: BreweryReviewSerializer, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def brewery_review_params
    params.require(:review).permit(:title, :content, :rating, :user_id, :brewery_id)
  end

end
