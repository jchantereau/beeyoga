class Session < ActiveRecord::Base
  belongs_to :course
  has_many :bookings

  monetize :price_cents
end
