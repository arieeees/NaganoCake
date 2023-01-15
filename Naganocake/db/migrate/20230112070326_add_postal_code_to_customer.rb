class AddPostalCodeToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :postal_code, :string, null: false
  end
end
