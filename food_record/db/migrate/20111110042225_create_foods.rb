class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :company
      t.float :amount
      t.float :calories
      t.float :fat_calories
      t.references :food_group
      t.references :unit

      t.timestamps
    end
    add_index :foods, :food_group_id
    add_index :foods, :unit_id
  end
end
