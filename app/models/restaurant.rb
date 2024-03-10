class Restaurant < ApplicationRecord
  has_many :restaurant_items
  has_many :items, through: :restaurant_items
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :cuisine, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  scope :newly_opened, -> { where('opening_date >= ?', 2.days.ago) }
  scope :trending, -> { order('rating DESC').limit(5) } 

  def average_rating
    reviews.average(:rating)
  end
  def self.with_item(item_name)
    joins(:items).where('items.name = ?', item_name)
  end
end