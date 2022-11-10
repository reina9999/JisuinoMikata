class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :customer_id
      t.integer :cook_id

      t.timestamps
    end
  end
end
