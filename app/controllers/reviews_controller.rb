class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
    
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @restaurant, notice: 'Review was successfully created.'
    else
   
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_name, :rating, :comment)
  end
end
