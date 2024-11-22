class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @offer = Offer.find(params[:offer_id])
    @user = current_user
  end

  def create
    @review = Review.new(review_params)
    @offer = Offer.find(params[:offer_id])
    @review.offer = @offer
    @review.user = current_user
    if @review.save
      redirect_to offer_path(@offer)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
