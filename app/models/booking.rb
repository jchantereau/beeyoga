class Booking < ActiveRecord::Base

  belongs_to :session
  validates_presence_of :email, :first_name, :last_name, :age, :phone, :motivation

  monetize :amount_cents
end
