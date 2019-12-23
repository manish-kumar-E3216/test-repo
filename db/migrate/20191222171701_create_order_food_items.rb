class CreateOrderFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_food_items do |t|
      t.integer :quantity
      t.integer :food_id
      t.integer :cart_id
      t.integer :order_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
