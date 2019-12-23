class CreateFoodcategories < ActiveRecord::Migration
  def change
    create_table :foodcategories do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
