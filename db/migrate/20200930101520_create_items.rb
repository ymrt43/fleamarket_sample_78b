class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, limit: 40, null: false, index: true
      t.text :description, limit: 1000, null: false
      t.string :brand
      t.integer :state, null: false
      t.integer :fee, null: false
      t.integer :prefecture_id, null: false
      t.integer :term, null: false
      t.integer :price, null: false
      t.references :seller, index: true, foreign_key: {to_table: :users}
      t.references :buyer, index: true, foreign_key: {to_table: :users}
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
