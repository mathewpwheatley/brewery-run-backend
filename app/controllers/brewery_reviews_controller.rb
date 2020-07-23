class BreweryReviewsController < ApplicationController
  # authorized comes from ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    brewery_review = BreweryReview.find(params[:id])
    render json: brewery_review, serializer: ReviewSerializer, status: :ok
  end

  def create
    brewery_review = BreweryReview.create(brewery_review_params)
    if brewery_review.valid?
      render json: brewery_review, serializer: ReviewSerializer, status: :accepted
    else
      render json: {errors: brewery_review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    brewery_review = BreweryReview.find(params[:id])
    brewery_review.update(brewery_review_params)
    if brewery_review.valid?
      render json: brewery_review, serializer: ReviewSerializer, status: :accepted
    else
      render json: {errors: brewery_review.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    brewery_review = BreweryReview.find(params[:id])
    brewery_review.destroy
    render json: {messages: ['Review has been delete']}, status: :ok
  end
  
  private
  # Only allow a list of trusted parameters through.
  def brewery_review_params
    params.require(:brewery_review).permit(:title, :content, :rating, :user_id, :brewery_id)
  end

end
