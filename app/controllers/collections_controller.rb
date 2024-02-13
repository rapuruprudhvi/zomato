class CollectionsController < ApplicationController
    def show
        @collection = Collection.find(params[:id])
        @restaurants = @collection.restaurants
        @places = @collection.places
      
        respond_to do |format|
          format.html 
          format.json { render json: @collection }
        end
      end
      
    end
