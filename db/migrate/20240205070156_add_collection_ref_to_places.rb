class AddCollectionRefToPlaces < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:places, :collection_id)
      add_reference :places, :collection, null: false, foreign_key: true
    end
  end
end
