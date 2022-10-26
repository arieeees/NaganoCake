class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :is_active, default: false, null: false

      t.timestamps
    end
  end
end
