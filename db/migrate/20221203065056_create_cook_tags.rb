class CreateCookTags < ActiveRecord::Migration[6.1]
  def change
    create_table :cook_tags do |t|
      t.string :name
      t.integer :cook_id

      t.timestamps
    end
  end
end
