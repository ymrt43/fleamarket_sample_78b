class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :familyname, null: false
      t.string :firlstname, null: false
      t.string :familykana, null: false
      t.string :firstkana, null: false
      t.date :birthdate,  null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
