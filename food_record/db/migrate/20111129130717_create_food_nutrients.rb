class CreateFoodNutrients < ActiveRecord::Migration
  def change
    create_table :food_nutrients do |t|
      t.float :amount
      t.references :food
      t.references :nutrient

      t.timestamps
    end
    add_index :food_nutrients, [:food_id, :nutrient_id], :unique => true
  end
end
