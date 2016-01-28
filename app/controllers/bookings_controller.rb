class BookingsController < ApplicationController
  before_action :set_session, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.validated = false
    @booking.state = "pending"
    @booking.session_sku = @session.sku
    @booking.session_id = @session.id
    @booking.amount_cents = @session.price_cents
    if @booking.save
      BookingMailer.creation_confirmation(@booking).deliver_now
      BookingMailer.admin_confirmation(@booking).deliver_now
      flash.notice = "Votre demande d'inscription a bien été reçu, nous revenons vers vous dans les plus bref délais"
      redirect_to sessions_path
    else
      flash[:alert] = "Votre réservation est incomplète, merci de vérifier que tous les champs sont remplis"
      render :new
    end
  end

  private

  def send_validation_email
    BookingMailer.validated(@booking).deliver_now unless @booking.validated == false
  end

  def set_session
    @session = Session.find(params[:session_id])
  end

  def booking_params
    params.require(:booking).permit(:email, :first_name, :last_name, :age, :phone, :motivation)
  end
end
