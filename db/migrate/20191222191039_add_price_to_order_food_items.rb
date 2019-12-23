class AddPriceToOrderFoodItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_food_items, :price, :integer
  end
end
