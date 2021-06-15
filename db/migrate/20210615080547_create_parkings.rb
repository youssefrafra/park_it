class CreateParkings < ActiveRecord::Migration[6.1]
  def change
    create_table :parkings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :description
      t.date :start_date
      t.date :end_date
      t.time :from_hour
      t.time :to_hour
      t.boolean :available

      t.timestamps
    end
  end
end
