class AddRooftopToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :rooftop, :boolean
  end
end
