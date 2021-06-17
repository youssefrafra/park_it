class RemoveAvailableToParkings < ActiveRecord::Migration[6.1]
  def change
    remove_column :parkings, :available
  end
end
