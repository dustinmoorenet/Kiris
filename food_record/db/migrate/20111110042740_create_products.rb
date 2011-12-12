class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :upc
      t.float :amount
      t.references :food

      t.timestamps
    end
    add_index :products, :food_id
  end
end
