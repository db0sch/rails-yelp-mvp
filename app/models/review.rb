class Review < ActiveRecord::Base
  RATINGS = [0, 1, 2, 3, 4, 5]
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :restaurant, presence: true
  validates_associated :restaurant
  validates :rating, inclusion: { in: RATINGS }
end
