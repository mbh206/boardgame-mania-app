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
    @days = @booking.end_date.to_datetime - @booking.start_date.to_datetime
    @booking.user = current_user
    @booking.offer = @offer
    @booking.total_price = @offer.price * @days
    @booking.status = 0 #pending status
    if @booking.save
      redirect_to user_path(current_user)
    else
      raise
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(bookings_params)
      redirect_to user_path(current_user)
    else
      redirect_to offer_path(@booking.offer) 
    end
  end

  private

  def bookings_params
      params.require(:booking).permit(
        :start_date,
        :end_date,
        :status
      )
  end
end
