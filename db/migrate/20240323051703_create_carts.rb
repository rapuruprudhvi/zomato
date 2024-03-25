class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    unless table_exists?(:carts)
      create_table :carts do |t|
        t.references :user, null: false, foreign_key: true
        t.timestamps
      end
    end
  end
end
