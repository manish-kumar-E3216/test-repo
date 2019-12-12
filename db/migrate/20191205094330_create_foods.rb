class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :foodcategory_id
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
