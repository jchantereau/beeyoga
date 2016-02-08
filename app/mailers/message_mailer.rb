class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.message_confirmation.subject
  #
  def message_confirmation(message)
    @message = message
    mail(
      to:       @message.email,
      subject:  "Merci #{@message.name} pour votre message"
    )
  end

  def message_admin(message)
    @message = message
    mail(
      to:       'remiballot@ballot-flurin.com',
      subject:  "Vous avez reçu un nouveau message sur Yoga des abeilles"
    )
  end

end
