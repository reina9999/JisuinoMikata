class CreateCooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cooks do |t|
    t.integer :customer_id
    t.string :name
    t.integer :required_time

    t.text :foods
    t.text :recipe
    t.timestamps
    end
  end
end
