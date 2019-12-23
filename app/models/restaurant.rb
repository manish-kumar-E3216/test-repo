class Restaurant < ActiveRecord::Base
  has_many :food_category_lists
  has_many :foodcategories, :through => :food_category_lists
  has_many :foodlists
  validates :name, presence: true, length: {maximum:50},
            uniqueness: { case_sensitive: false }
end
