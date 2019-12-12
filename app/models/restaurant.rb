class Restaurant < ActiveRecord::Base
  has_many :food_category_lists
  has_many :foodcategories, :through => :food_category_lists
  has_many :foodlists
end
