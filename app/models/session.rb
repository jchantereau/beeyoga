class Session < ActiveRecord::Base
  belongs_to :course
  has_many :bookings
end
