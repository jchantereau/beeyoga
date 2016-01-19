class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :start_date
      t.date :end_date
      t.string :location
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
