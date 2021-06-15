class AddTitleToParkings < ActiveRecord::Migration[6.1]
  def change
    add_column :parkings, :title, :string
  end
end
