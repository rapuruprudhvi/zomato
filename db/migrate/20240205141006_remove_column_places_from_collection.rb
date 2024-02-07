class RemoveColumnPlacesFromCollection < ActiveRecord::Migration[7.1]
  def change 
    remove_column :collections, :places, :string
  end
end
