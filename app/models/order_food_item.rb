class OrderFoodItem < ApplicationRecord
  belongs_to :food
  belongs_to :cart
  belongs_to :order
  belongs_to :foodlist

  # LOGIC
  def total_price
    self.quantity * self.price
  end
end
