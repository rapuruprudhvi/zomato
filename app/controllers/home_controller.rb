class HomeController < ApplicationController
  def index
    BookingRemainderJob.set(wait_until: 1.minute.from_now).perform_later(1)

    if params[:rating].present?
      @restaurants = Restaurant.where("rating >= ?", params[:rating].to_i).order(rating: :desc)
    else
      @restaurants = Restaurant.all
    end
    if params[:sort].present?
      @restaurants = @restaurants.order(rating: :asc)
    end
    @newly_opened_restaurants = Restaurant.newly_opened
    @trending_restaurants = Restaurant.trending
    @collections = Collection.includes(:places).all
  end 
end
