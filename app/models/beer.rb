class Beer < ActiveRecord::Base
  attr_accessible :brewery, :note, :rating, :title, :wishlist
  
  validates :title, :presence => true
  validates :brewery, :presence => true
  
  validates :rating, :numericality => true, :length => {:within => 1..5}
end
