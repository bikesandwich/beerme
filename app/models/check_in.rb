class CheckIn < ActiveRecord::Base
  attr_accessible :beer_id, :rating, :review, :user_id, :wishlist
  
  belongs_to :beer
  belongs_to :user
end
