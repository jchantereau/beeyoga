class BookingsController < ApplicationController
  before_action :set_session, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.validated = false
    if @booking.save
      raise
      redirect_to sessions_path
    else
      flash[:alert] = "Votre réservation est incomplète, merci de vérifier que tous les champs sont remplis"
      render :new
    end
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end

  def booking_params
    params.require(:booking).permit(:email, :first_name, :last_name, :age, :phone, :motivation)
  end
end
