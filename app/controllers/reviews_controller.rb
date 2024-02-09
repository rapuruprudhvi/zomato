
class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:create]
  
    def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = @restaurant.reviews.new(review_params)
      @review.user = current_user
  
      if @review.save
        redirect_to @restaurant, notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
  