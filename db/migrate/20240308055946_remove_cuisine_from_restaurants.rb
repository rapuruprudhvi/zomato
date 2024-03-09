class RemoveCuisineFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :cuisine, :string
  end
end
