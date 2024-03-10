class CreateRestaurantItems < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_items do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
