class Cart < ApplicationRecord
  has_many :order_food_items, dependent: :destroy
  has_many :foods, through: :order_food_items
  has_many :foodlists

  # LOGIC
  def sub_total
    sum = 0
    self.order_food_items.each do |line_item|
      sum+= line_item.total_price
    end
    return sum
  end
end
