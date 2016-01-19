class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :phone
      t.text :motivation
      t.boolean :validated

      t.timestamps null: false
    end
  end
end
