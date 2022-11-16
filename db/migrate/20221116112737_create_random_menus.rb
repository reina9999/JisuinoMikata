class CreateRandomMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :random_menus do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.integer :monday, null: false
      t.integer :tuesday, null: false
      t.integer :wednesday, null: false
      t.integer :thursday, null: false
      t.integer :friday, null: false
      t.integer :saturday, null: false
      t.integer :sunday, null: false
      t.timestamps
    end
  end
end
