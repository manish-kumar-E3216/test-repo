class Foodlist < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :food
  belongs_to :foodcategory
  has_one :foodcategory, :through => :food
end
