class BookingsController < ApplicationController
  def show
    @bookings = Booking.all
  end

#Steve's addition:
  def new
    @boardgames = Boardgame.all
    @booking = Booking.new
    end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.offer = @offer
    if @booking.save
      redirect_to user_path(current_user)
    else
      raise
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def bookings_params
      params.require(:booking).permit(
        :start_date,
        :end_date
      )
  end
end
