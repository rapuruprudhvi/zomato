class ItemsController < ApplicationController
    def index
        @items = Item.all
      end
      def rating
        @items = Item.where("rating >= ?", 4)
      end
end
