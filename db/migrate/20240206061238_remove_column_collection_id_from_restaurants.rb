class RemoveColumnCollectionIdFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :collection_id, :bigint
  end
end
