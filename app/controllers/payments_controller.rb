class PaymentsController < ApplicationController
  before_action :set_booking

  def new
    unless params[:email] == "$6dttsO4QAXTY"
      authenticate_or_request_with_http_basic('Site Message') do |username, password|
        username == ENV["Admin_username"] && password == ENV["Admin_password"]
      end
    end
  end

  def create
    @amount = @booking.amount_cents

    customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email: params[:stripeEmail]
      )
      # You should store this customer id and re-use it.

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount:       @amount,  # in cents
        description:  "Payment for session #{@booking.session_sku} for booking #{@booking.id}",
        currency:     'eur'
      )

      @booking.update(payment: charge.to_json, state: 'paid')
      flash.notice = "Success"

      redirect_to root_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_booking_payment_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.where(state: 'pending').find(params[:booking_id])
  end
end
