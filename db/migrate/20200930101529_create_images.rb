class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.text :image
      t.timestamps
    end
  end
end
