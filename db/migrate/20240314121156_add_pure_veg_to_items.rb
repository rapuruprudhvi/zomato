class AddPureVegToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :pure_veg, :boolean
  end
end
