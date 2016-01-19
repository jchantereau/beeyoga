class AddSessionToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :session, index: true, foreign_key: true
  end
end
