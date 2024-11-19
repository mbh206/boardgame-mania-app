class OffersController < ApplicationController
  def show
    @booking = Booking.find(params[:owner_id])
    @offer = Offer.find(params[:id])
    # raise
  end
end
