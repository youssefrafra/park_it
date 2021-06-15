class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parking, null: false, foreign_key: true
      t.string :status
      t.date :start_date
      t.date :end_date
      t.time :from_hour
      t.time :to_hour

      t.timestamps
    end
  end
end
