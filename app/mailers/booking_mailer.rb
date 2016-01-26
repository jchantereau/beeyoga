class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.creation.subject
  #
  def creation_confirmation(booking)
    @booking = booking
    mail(
      to:       @booking.email,
      subject:  "Merci #{@booking.first_name} pour votre demande d'inscription"
    )
  end

  def admin_confirmation(booking)
    @booking = booking
    mail(
      to:       'remiballot@ballot-flurin.com',
      subject:  "Vous avez reçu une nouvelle demande d'inscription"
    )
  end

  def validated(booking)
    @booking = booking
    mail(
      to:       @booking.email,
      subject:  "Votre demande d'inscription est confirmée !"
    )
  end
end
