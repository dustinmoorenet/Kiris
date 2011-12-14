class Food < ActiveRecord::Base
  belongs_to :food_group
  belongs_to :unit
  belongs_to :company
  has_many :products
  has_many :food_nutrients
  has_many :nutrients, :through => :food_nutrients

  define_index do
    indexes name, :sortable => true
    indexes company.name, :as => :company_name, :sortable => true
    indexes products.name, :as => :product_name, :sortable => true
    indexes nutrients.name, :as => :nutrient_name, :sortable => true
    indexes food_group.id, :as => :food_group_id, :sortable => true
    indexes food_group.name, :as => :food_group_name, :sortable => true

    has unit_id, created_at, calories, fat_calories
  end
end
