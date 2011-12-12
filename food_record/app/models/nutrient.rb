class Nutrient < ActiveRecord::Base
  belongs_to :unit
  has_many :food_nutrients
  has_many :foods, :through => :food_nutrients

  define_index do
    indexes name, :sortable => true
    indexes abbv, :sortable => true
    indexes food(:name), :as => :food_name, :sortable => true

    has unit_id, created_at
  end
end
