class Restaurant < ApplicationRecord
    validates :name, presence: true
    validates :address, presence: true
    validates :cuisine, presence: true
    validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    scope :newly_opened, -> { where('opening_date >= ?', 2.days.ago) }
    scope :trending, -> { order('rating DESC').limit(5) } 
    has_many :reviews
   
end
