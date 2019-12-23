class Foodcategory < ActiveRecord::Base
  has_many :food_category_lists
  has_many :restaurants, :through => :food_category_lists
  has_many :foodlists, through: :foods
  has_many :foods
  validates :name, presence:true, length: { maximum: 100, message: "%{count} characters is the maximum allowed" },
            uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 250, message: "%{count} characters is the maximum allowed" }
end
