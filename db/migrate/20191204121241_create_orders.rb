class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.date :date
      t.string :cityinfo_id
      t.string :address
      t.string :comments
      t.integer :cost

      t.timestamps null: false
    end
  end
end
