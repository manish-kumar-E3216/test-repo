class Foodcategory < ActiveRecord::Base
  has_many :food_category_lists
  has_many :restaurants, :through => :food_category_lists
  has_many :foodlists, through: :foods
  has_many :foods
end
