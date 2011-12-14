class CreateNutrients < ActiveRecord::Migration
  def change
    create_table :nutrients do |t|
      t.string :name
      t.string :abbv
      t.float :daily_base
      t.references :unit

      t.timestamps
    end
    add_index :nutrients, :unit_id
  end
end
