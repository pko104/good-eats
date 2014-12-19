class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, length: {minimum: 2}
  validates :zipcode, length: {minimum: 5}
  has_many :reviews
end
