class Food < ActiveRecord::Base
  validates :name, presence:true, length: { maximum: 100, message: "%{count} characters is the maximum allowed" },
            uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 250, message: "%{count} characters is the maximum allowed" }
  belongs_to :foodcategory
  has_many :foodlists
end
