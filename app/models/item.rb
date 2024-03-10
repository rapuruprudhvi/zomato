class Item < ApplicationRecord
  has_many :restaurant_items
  has_many :restaurants, through: :restaurant_items
end
