class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @offers = current_user.offers
    @bookings = current_user.bookings
    @bookings_as_owner = current_user.bookings_as_owner.where.not(user: current_user)
  end
end
