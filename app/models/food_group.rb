class FoodGroup < ActiveRecord::Base
  has_many :foods

  define_index do
    indexes name, :sortable => true
  end
end
