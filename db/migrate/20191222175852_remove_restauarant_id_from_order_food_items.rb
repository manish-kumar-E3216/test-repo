class RemoveRestauarantIdFromOrderFoodItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_food_items, :restaurant_id, :integer
  end
end
