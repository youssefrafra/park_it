class AddAvailableToParkings < ActiveRecord::Migration[6.1]
  def change
    add_column :parkings, :available, :boolean, default: true
  end
end
