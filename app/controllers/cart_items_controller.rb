class CartItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])  # Assuming you're retrieving the item based on some parameters
    @cart_item = current_user.cart_items.find_or_initialize_by(item_id: @item.id)
  end

  def index
    @cart = current_user.cart || current_user.build_cart
    @cart_items = @cart.cart_items
  end

  def create
    @cart_item = current_user.cart.cart_items.build(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(current_user.cart), notice: 'Item added to cart successfully.'
    else
      # handle error
    end
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

  end
  def add_to_cart
    @item = Item.find(params[:item_id])
    @cart_item = current_user.cart.cart_items.find_by(item_id: @item.id)
    render partial: 'quantity_buttons', locals: { item: @item, cart_item: @cart_item, return_type: 'buttons' }
  end
end
