class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart
  
  def show
    @cart_items = @cart.cart_items.includes(:item)
  end
  
  def add_to_cart
    @item = Item.find(params[:item][:id])
    @cart_item = @cart.cart_items.find_or_create_by(item_id: @item.id)
    @cart_item.increment!(:quantity)
    @quantity = @cart_item.quantity
  
    respond_to do |format|
      format.js
    end
  end
  
  
  def decrement_cart_quantity
    @item = Item.find(params[:id])
    @cart_item = @cart.cart_items.find_by(item_id: @item.id)
    @cart_item.decrement!(:quantity) if @cart_item && @cart_item.quantity > 1
    @quantity = @cart_item.quantity
   render 'add_to_cart'
    # respond_to do |format|
    #   format.js
    # end
  end
  
  def increment_cart_quantity

    @item = Item.find(params[:id])
    @cart_item = @cart.cart_items.find_by(item_id: @item.id)
    @cart_item.increment!(:quantity) if @cart_item
    @quantity = @cart_item.quantity
    render 'add_to_cart'

    # respond_to do |format|
    #   format.js
    # end
  end

  private

  def set_cart
    @cart = current_user.cart || Cart.create!(user_id: current_user.id)
  end
end
