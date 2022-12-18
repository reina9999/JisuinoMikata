class AddRateToCook < ActiveRecord::Migration[6.1]
  def change
    add_column :cooks, :rate, :float
  end
end
