class Product < ActiveRecord::Base
  belongs_to :food

  define_index do
    indexes name, :sortable => true
    indexes food(:name), :as => :food_name
    indexes upc

    has created_at
  end
end
