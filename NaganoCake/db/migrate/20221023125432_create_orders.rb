class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      
      t.integer :customer_id
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_method, default: 0, null: false
      t.integer :status, default: 0, null: false
      t.string :name
      t.string :address
      t.string :postal_code

      t.timestamps
    end
  end
end
