class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, limit: 40, null: false, index: true
      t.text :description, null: false
      t.string :brand
      t.integer :state, null: false
      t.integer :fee, null: false
      t.integer :area, null: false
      t.integer :term, null: false
      t.integer :price, null: false
      t.integer :buyer_id
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
