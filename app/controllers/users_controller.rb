class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offers = current_user.offers
    @bookings = current_user.bookings
  end
end
