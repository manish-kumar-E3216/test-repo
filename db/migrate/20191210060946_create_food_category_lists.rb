class CreateFoodCategoryLists < ActiveRecord::Migration
  def change
    create_table :food_category_lists do |t|
      t.integer :restaurant_id
      t.integer :foodcategory_id

      t.timestamps null: false
    end
  end
end
