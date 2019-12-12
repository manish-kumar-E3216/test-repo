class CreateFoodlists < ActiveRecord::Migration
  def change
    create_table :foodlists do |t|
      t.integer :restaurant_id
      t.integer :food_id
      t.string  :cityinfo_id
      t.integer :foodcost
      t.timestamps null: false
    end
  end
end
