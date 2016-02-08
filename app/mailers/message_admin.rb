class MessageAdmin < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_admin.message_admin.subject
  #
  def message_admin
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
