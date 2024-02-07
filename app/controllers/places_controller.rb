class PlacesController < ApplicationController
  def index
    @collections = Collection.all
  end
end
