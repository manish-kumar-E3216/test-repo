class FoodCategoryList < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :foodcategory
end
