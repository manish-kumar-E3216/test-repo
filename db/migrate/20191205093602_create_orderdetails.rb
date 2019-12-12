class CreateOrderdetails < ActiveRecord::Migration
  def change
    create_table :orderdetails do |t|
      t.integer :order_id
      t.integer :food_id
      t.integer :restaurant_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
