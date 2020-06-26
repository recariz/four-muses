class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @my_contests = current_user.contest_applications

  end


end


    # @my_bookings = current_user.bookings
    # @my_pools = current_user.pools

    # @my_booking_requests = Booking.all.select do |booking|
    # booking.pool.user == current_user
    # end
