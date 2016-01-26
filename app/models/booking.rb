class Booking < ActiveRecord::Base

  belongs_to :session
  after_update :send_validation_email

  validates_presence_of :email, :first_name, :last_name, :age, :phone, :motivation
end
