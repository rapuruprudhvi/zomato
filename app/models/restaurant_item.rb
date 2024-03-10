class RestaurantItem < ApplicationRecord
  belongs_to :restaurant
  belongs_to :item
end
