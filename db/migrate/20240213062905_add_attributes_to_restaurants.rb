class AddAttributesToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :outdoor_seating, :boolean
    add_column :restaurants, :serves_alcohol, :boolean
    add_column :restaurants, :open_now, :boolean
  end
end
