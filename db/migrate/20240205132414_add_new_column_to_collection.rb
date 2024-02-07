class AddNewColumnToCollection < ActiveRecord::Migration[7.1]
  def change
    add_column :collections,:places, :string
  end
end
