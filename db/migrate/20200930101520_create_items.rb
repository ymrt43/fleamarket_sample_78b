class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :description, null:false
      t.integer :category_id, null: false, foreign_key: true
      t.string :brand
      t.integer :state, null: false
      t.integer :fee, null: false
      t.integer :area, null: false 
      t.integer :term, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
