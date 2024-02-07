class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
  def newly_opened
    @restaurants = Restaurant.where("opening_date >= ?", 30.days.ago)
    render :index 
  end
  def best_rated
    @restaurants = Restaurant.order(rating: :desc)
    render :index 
  end
  def trending_restaurant
    @restaurants = Restaurant.order(rating: :desc)
    render :index 
  end
  def rooftop
    @restaurants = Restaurant.where(rooftop: true)
    render :index 
  end

end
