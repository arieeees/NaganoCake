class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id
      t.integer :item_id
      t.integer :amount
      t.integer :price
      t.integer :making_status, default: 0,null: false

      t.timestamps
    end
  end
end
