class RestaurantItemsController < ApplicationController

  def show_restaurants

    item_name = params[:item_name]
    @restaurants = Restaurant.joins(:restaurant_items).where(restaurant_items: { item_id: Item.where(name: item_name) })
  end
  
  def items_details
    
  
    @item = Item.find(params[:id])
    @restaurants = @item.restaurants  
    @cart_item = CartItem.find_by(item_id: params[:item_id])

    if user_signed_in?
    @cart = current_user.cart || Cart.create!(user_id: current_user.id)   
    @cart_items = @cart.cart_items
    @quantity = @cart_items.find_by(item_id: @item.id)&.quantity
   else
    @quantity = 0
    end   
  end
end