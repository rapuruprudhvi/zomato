class ItemsController < ApplicationController
    def index
        @items = Item.all
      end
      def rating
        @items = Item.where("rating >= ?", 4)
      end
     def show
      @items = Item.joins(:restaurants).where(name: params[:item_name])
    end
end
