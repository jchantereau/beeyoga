class Session < ActiveRecord::Base
  belongs_to :course
  has_many :bookings

  monetize :price_cents
  validates :price_cents, numericality: { greater_than: 10000, message: "Attention, prix < 100!" }
end
