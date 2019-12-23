class AddFoodcategoryIdToFoodlists < ActiveRecord::Migration
  def change
    add_column :foodlists, :foodcategory_id, :integer
  end
end
