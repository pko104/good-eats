class Review < ActiveRecord::Base
  validates :restaurant_id, presence: true
  validates :message, length: {minimum: 25}
  validates :rating, presence: true
  belongs_to :restaurant
end
