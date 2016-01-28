class AddPaymentToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :sku, :string
    add_monetize :sessions, :price, currency: { present: false }
  end
end
