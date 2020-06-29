class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @my_applications = current_user.contest_applications

    @my_application_requests = ContestApplication.all.select do |application|
      application.contest.user == current_user
    end
  end


end


    # @my_bookings = current_user.bookings
    # @my_pools = current_user.pools

    # @my_booking_requests = Booking.all.select do |booking|
    # booking.pool.user == current_user
    # end
