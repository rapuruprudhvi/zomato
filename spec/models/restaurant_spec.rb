require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "#average_rating" do
    it "returns the average rating of the restaurant's reviews" do
      restaurant = Restaurant.create(name: "Example Restaurant", address: "123 Main St", cuisine: "Italian")
      Review.create(restaurant: restaurant, rating: 3)
      Review.create(restaurant: restaurant, rating: 5)
    
    end
  end
  
end
