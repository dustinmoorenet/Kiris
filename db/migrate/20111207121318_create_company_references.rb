class CreateCompanyReferences < ActiveRecord::Migration
  def up
    food_companies = {}
    Food.all.each do |food|
      company = Company.find_or_create_by_name(food[:company])
      food_companies[food.id] = company
    end

    remove_column :foods, :company
    add_column :foods, :company_id, :int

    Food.reset_column_information
    Food.all.each do |food|
      food.company = food_companies[food.id]
    end
  end

  def down
    food_companies = {}
    Food.all.each do |food|
      food_companies[food.id] = food[:company][:name]
    end

    remove_column :foods, :company_id
    add_column :foods, :company, :string

    Food.reset_column_information
    Food.all.each do |food|
      food[:company] = food_companies[food.id]
    end
  end
end
