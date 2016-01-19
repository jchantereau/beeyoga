class BookingsController < ApplicationController

  def new
    @session = Session.find(params[:session_id])
    @booking = Booking.new
  end

  def create
  end
end
