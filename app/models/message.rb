class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :content
  validates_format_of :email, :with => /@/

  # after_create: send_confirmation_email

  private

  def send_confirmation_email

  end
end
