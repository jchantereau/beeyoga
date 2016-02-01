class Booking < ActiveRecord::Base

  belongs_to :session
  validates_presence_of :email, :first_name, :last_name, :age, :phone, :motivation
  validates_format_of :email, :with => /@/

  monetize :amount_cents
  after_update :send_validation_email

  private

  def send_validation_email
    BookingMailer.validated(self).deliver_now unless validated == false
  end
end
