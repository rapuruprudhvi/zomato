class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end
 
  def newly_opened
    @restaurants = Restaurant.where("opening_date >= ?", 30.days.ago)
    render :index
  end

  def best_rated
    @restaurants = Restaurant.where("created_at >= ?", 30.days.ago).order(rating: :desc)
    render :index
  end

  def trending
    @restaurants = Restaurant.where("created_at >= ?", 30.days.ago).order(rating: :desc)
    render :index
  end

  def rooftop
    @restaurants = Restaurant.where(rooftop: true)
    binding.break
    render :index
  end

  def rating
    @restaurants =  Restaurant.where("rating >= ?", 4.0)
  end

  def outdoor_seating
    @restaurants = Restaurant.where(outdoor_seating: true)
  end


    def serves_alcohol
    @restaurants = Restaurant.where(serves_alcohol: true)
    end

  def show
    if @restaurant
      @reviews = @restaurant.reviews.page(params[:page]).per(2) 
    else
      flash[:error] = "Restaurant not found"
      redirect_to restaurants_path
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:id])
  end
end
