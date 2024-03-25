class CartItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])  # Assuming you're retrieving the item based on some parameters
    @cart_item = current_user.cart_items.find_or_initialize_by(item_id: @item.id)
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end
  def add_to_cart
    @item = Item.find(params[:item_id])
    @cart_item = current_user.cart.cart_items.find_by(item_id: @item.id)
    render partial: 'quantity_buttons', locals: { item: @item, cart_item: @cart_item, return_type: 'buttons' }
  end
end
