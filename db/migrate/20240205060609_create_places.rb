class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name
      t.float :rating
      t.boolean :outdoor_seating
      t.boolean :serves_alcohol
      t.boolean :open_now

      t.timestamps
    end
  end
end
