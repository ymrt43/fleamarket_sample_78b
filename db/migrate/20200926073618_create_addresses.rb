class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postalcode, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_number, null: false
      t.string :dial_number, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
