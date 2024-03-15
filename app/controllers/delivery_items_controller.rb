class DeliveryItemsController < ApplicationController
  def index
    item_name = params[:item_name]
    @restaurants = Restaurant.joins(:restaurant_items).where(restaurant_items: { item_id: Item.where(name: item_name) })
  end
  def veg
    @veg_items = Item.where(pure_veg: true)  
end
end