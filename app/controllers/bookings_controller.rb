class BookingsController < ApplicationController
  def show
    @bookings = Booking.all
  end
end
