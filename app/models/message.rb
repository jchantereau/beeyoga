class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :content
  validates_format_of :email, :with => /@/

  after_create :send_confirmation_email

  private

  def send_confirmation_email
    MessageMailer.message_confirmation(self).deliver_now
  end

  def send_admin_email
    MessageMailer.message_admin(self).deliver_now
  end
end
