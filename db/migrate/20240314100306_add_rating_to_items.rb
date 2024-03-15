class AddRatingToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :rating, :decimal
  end
end
