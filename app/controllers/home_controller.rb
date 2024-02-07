class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @newly_opened_restaurants = Restaurant.newly_opened
    @trending_restaurants = Restaurant.trending
    @collections = Collection.includes(:places).all
  end 
end
