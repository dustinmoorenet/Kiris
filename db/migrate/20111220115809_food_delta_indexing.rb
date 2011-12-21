class FoodDeltaIndexing < ActiveRecord::Migration
  def up
    add_column :foods, :delta, :boolean, :default => true, :null => false
  end

  def down
    remove_column :foods, :delta
  end
end
