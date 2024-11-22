class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show]
  def show
    @booking = Booking.new
    @offer = Offer.find(params[:id])
    @reviews = Review.where(offer_id: params[:id])
  end

  def new
    @boardgames = Boardgame.all
    @offer = Offer.new
  end
  def create
    @offer = Offer.new(offers_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to user_path(offers_params[:user_id])
  end

  private

  def offers_params
        params.require(:offer).permit(
        :boardgame_id,
        :user_id,
        :price,
        :description,
        :title,
        photos: [])
  end
end
