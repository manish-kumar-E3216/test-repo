class Order < ActiveRecord::Base
  belongs_to :user
  validates :user_id,:cost, presence:true, numericality: { only_integer: true }
  validates :address, presence:true, length: { maximum: 250, message: "%{count} characters is the maximum allowed" }
  validates :comments, length: { maximum: 250, message: "%{count} characters is the maximum allowed" }
end
