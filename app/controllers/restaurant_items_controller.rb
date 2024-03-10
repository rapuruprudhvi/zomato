class RestaurantItemsController < ApplicationController
    def show_restaurants
        item_name = params[:item_name]
        @restaurants = Restaurant.joins(:restaurant_items).where(restaurant_items: { item_id: Item.where(name: item_name) })
      end
end
